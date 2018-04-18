var snake;
var scl = 20;

var food;

var score = 0;
var displayScore = 'score: ' + score;
var canvasHeight = 600;
var canvasWidth = 550;


function setup() {
  createCanvas(600, 600);
  snake = new Snake();
  frameRate(10);
  pickLocation();
}

function pickLocation() {
  var cols = floor(canvasWidth/scl);
  var rows = floor(canvasHeight/scl);
  food = createVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
}

function draw() {
  snake.death();
  if (!snake.dead) {
    background(51);
    fill(255, 255, 255);
    rect(0, 560, 600, 50)
    
    snake.update();
    snake.show();
    
    if (snake.eat(food)) {
      pickLocation();
      score++;
      displayScore = 'score: ' + score;
    }
    
    fill(255, 0, 100);
    rect(food.x, food.y, scl, scl);
    
    textSize(32);
    fill(0, 102, 153);
    console.log(displayScore);
    text(displayScore, 10, 592);
  } else {
    textSize(60);
    fill(0, 102, 153);
    text('Game Over', 150, 300);
  }
  
}

function keyPressed() {
  if (keyCode === UP_ARROW && snake.yspeed !== 1) {
    snake.dir(0, -1);
  } else if (keyCode === DOWN_ARROW && snake.yspeed !== -1) {
    snake.dir(0, 1);
  } else if (keyCode === LEFT_ARROW && snake.xspeed != 1) {
    snake.dir(-1, 0);
  } else if (keyCode === RIGHT_ARROW && snake.xspeed != -1) {
    snake.dir(1, 0);
  }
}
