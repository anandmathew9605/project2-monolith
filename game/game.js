// game.js - Fixed 3-Column Leaderboard
const canvas = document.getElementById("gameCanvas");
const ctx = canvas.getContext("2d");

const COLS = 20;
const ROWS = 12;
const TILE = canvas.width / COLS;
const TICK_MS = 120;

let snake = [];
let dir = { x: 1, y: 0 };
let nextDir = { x: 1, y: 0 };
let food = null;
let gameRunning = false;
let gameInterval = null;
let score = 0;

const startBtn = document.getElementById("startBtn");
const scoreEl = document.getElementById("score");
const leaderboardBody = document.getElementById("leaderboardBody");
const gameLabel = document.querySelector(".game-label");
const gameControls = document.querySelector(".game-controls");

const deploymentDetails = [
  "",
  "    SNAKE GAME - CLASSIC DESIGN",
  "    ----------------------------",
  "",
  "- Snake Game with MySQL leaderboard",
  "- Monolithic architecture on EC2 instance",
  "- Frontend: HTML5 Canvas + Vanilla JavaScript",
  "- Backend: PHP with MySQL",
  "- Total Size: 21.5 KB"
];

function showGameUI() {
  gameLabel.style.display = "block";
  gameControls.style.display = "flex";
  scoreEl.parentElement.style.display = "block";
}

function hideGameUI() {
  gameLabel.style.display = "none";
  gameControls.style.display = "none";
}

function resetGame() {
  snake = [{ x: 8, y: 10 }, { x: 9, y: 10 }, { x: 10, y: 10 }];
  dir = { x: 1, y: 0 };
  nextDir = { x: 1, y: 0 };
  score = 0;
  food = spawnFood();
  updateScoreUI();
  showGameUI();
}

function startGame() {
  if (gameRunning) return;
  resetGame();
  gameRunning = true;
  startBtn.disabled = true;
  hideGameUI();
  gameInterval = setInterval(tick, TICK_MS);
  canvas.focus();
}

function endGame() {
  gameRunning = false;
  startBtn.disabled = false;
  if (gameInterval) {
    clearInterval(gameInterval);
    gameInterval = null;
  }
  showGameUI();
  render();
  setTimeout(() => { showGameOverDialog(); }, 50);
}

function tick() {
  if ((nextDir.x !== -dir.x || nextDir.y !== -dir.y) || snake.length === 1) {
    dir = nextDir;
  }
  const head = snake[snake.length - 1];
  const newHead = { x: head.x + dir.x, y: head.y + dir.y };

  if (newHead.x < 0 || newHead.x >= COLS || newHead.y < 0 || newHead.y >= ROWS) {
    endGame();
    return;
  }

  for (let seg of snake) {
    if (seg.x === newHead.x && seg.y === newHead.y) {
      endGame();
      return;
    }
  }

  snake.push(newHead);

  if (food && newHead.x === food.x && newHead.y === food.y) {
    score += 10;
    updateScoreUI();
    food = spawnFood();
  } else {
    snake.shift();
  }
  render();
}

function render() {
  ctx.fillStyle = "#fff";
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  if (!gameRunning) {
    drawDeploymentDetails();
  }

  if (gameRunning) {
    if (food) drawTile(food.x, food.y, "#000");
    for (let i = 0; i < snake.length; i++) {
      const s = snake[i];
      drawTile(s.x, s.y, (i === 0 || i === snake.length - 1) ? ((i===0)?"#777":"#000") : "#333");
    }
  }
}

function drawDeploymentDetails() {
  ctx.fillStyle = "#000";
  ctx.font = "11px 'Fira Code', monospace";
  ctx.textAlign = "left";
  let y = 50;
  deploymentDetails.forEach(line => {
    ctx.fillText(line, 10, y);
    y += 14;
  });
}

function drawTile(x, y, color) {
  ctx.fillStyle = color;
  ctx.fillRect(x * TILE + 1, y * TILE + 1, TILE - 2, TILE - 2);
}

function spawnFood() {
  const empty = [];
  for (let x = 0; x < COLS; x++) {
    for (let y = 0; y < ROWS; y++) {
      let occupied = false;
      for (let s of snake) {
        if (s.x === x && s.y === y) { occupied = true; break; }
      }
      if (!occupied) empty.push({ x, y });
    }
  }
  if (empty.length === 0) return null;
  return empty[Math.floor(Math.random() * empty.length)];
}

function updateScoreUI() {
  scoreEl.textContent = score;
}

window.addEventListener("keydown", (e) => {
  if (!gameRunning) return;
  const key = e.key;
  if (key === "ArrowUp" || key === "w" || key === "W") { nextDir = { x: 0, y: -1 }; e.preventDefault(); }
  else if (key === "ArrowDown" || key === "s" || key === "S") { nextDir = { x: 0, y: 1 }; e.preventDefault(); }
  else if (key === "ArrowLeft" || key === "a" || key === "A") { nextDir = { x: -1, y: 0 }; e.preventDefault(); }
  else if (key === "ArrowRight" || key === "d" || key === "D") { nextDir = { x: 1, y: 0 }; e.preventDefault(); }
});

function submitScore(name, scoreVal) {
  fetch("/api/submit_score.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ name: name, score: scoreVal })
  })
  .then(r => r.json())
  .finally(() => loadLeaderboard());
}

function loadLeaderboard() {
  fetch("/api/get_scores.php")
    .then(r => r.json())
    .then(data => {
      leaderboardBody.innerHTML = "";
      if (data && data.status === "success") {
        data.data.forEach((row, index) => {
          const tr = document.createElement("tr");
          const rank = index + 1;
          // FIXED: Split into 3 distinct columns
          tr.innerHTML = `<td>${rank}.</td><td>${escapeHtml(row.player_name)}</td><td>${escapeHtml(row.score)}</td>`;
          leaderboardBody.appendChild(tr);
        });
      }
    })
    .catch(err => console.error("leaderboard fetch error", err));
}

function escapeHtml(s) {
  return String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
}

function showGameOverDialog() {
  document.getElementById("gameOverMessage").textContent = `Your Score is: ${score}`;
  const input = document.getElementById("playerNameInput");
  input.value = "player";
  document.getElementById("gameOverDialog").style.display = "flex";
  input.focus();
}

function closeGameOverDialog() {
  document.getElementById("gameOverDialog").style.display = "none";
  loadLeaderboard();
}

function submitGameOverScore() {
  const name = document.getElementById("playerNameInput").value.trim();
  if (name.length > 0) {
    submitScore(name, score);
    score = 0;
    updateScoreUI();
    closeGameOverDialog();
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const input = document.getElementById("playerNameInput");
  if (input) {
    input.addEventListener("keypress", (e) => {
      if (e.key === "Enter") submitGameOverScore();
    });
  }
});

startBtn.addEventListener("click", startGame);
resetGame();
render();
loadLeaderboard();
