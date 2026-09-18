let score = 0;
let playerSpeed = 5;
let player = document.getElementById("player");

document.addEventListener("keydown", function(event) {
    if (event.key === "ArrowLeft") {
        player.style.left = "100px";
    }

    if (event.key === "ArrowRight") {
        player.style.left = "250px";
    }
});
let enemySpeed = 3;
