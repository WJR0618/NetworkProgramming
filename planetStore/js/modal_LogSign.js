// Get the modal
var logSignModal = document.getElementById("logSignModal");
var cartModal = document.getElementById("cartModal");

// Get the button that opens the modal
var logSignModalBtn = document.getElementById("logSignModalBtn");
var cartModalBtn = document.getElementById("cartModalBtn");

// Get the <span> element that closes the modal
var span = document.getElementById("close");

// When the user clicks on the button, open the modal
logSignModalBtn.onclick = function() {
  logSignModal.style.display = "block";
}

cartModalBtn.onclick = function() {
  cartModal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  logSignModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == logSignModal) {
    logSignModal.style.display = "none";
  }
  else if (event.target == cartModal) {
    cartModal.style.display = "none";
  }
}