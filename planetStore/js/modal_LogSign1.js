// Get the modal
var cartModal = document.getElementById("cartModal");

// Get the button that opens the modal
var cartModalBtn = document.getElementById("cartModalBtn");

cartModalBtn.onclick = function() {
  cartModal.style.display = "block";
}


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == cartModal) {
    cartModal.style.display = "none";
  } // if
}