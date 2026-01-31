// Location buttons horizontal scroll functionality
document.addEventListener('DOMContentLoaded', function() {
  const locationButtons = document.querySelector('.location-buttons');
  const scrollLeftBtn = document.querySelector('.location-scroll-left');
  const scrollRightBtn = document.querySelector('.location-scroll-right');

  if (!locationButtons) return;

  // Scroll left
  if (scrollLeftBtn) {
    scrollLeftBtn.addEventListener('click', function() {
      locationButtons.scrollBy({
        left: -200,
        behavior: 'smooth'
      });
    });
  }

  // Scroll right
  if (scrollRightBtn) {
    scrollRightBtn.addEventListener('click', function() {
      locationButtons.scrollBy({
        left: 200,
        behavior: 'smooth'
      });
    });
  }

  // Show/hide scroll buttons based on scroll position
  function updateScrollButtons() {
    if (!scrollLeftBtn || !scrollRightBtn) return;
    
    const scrollLeft = locationButtons.scrollLeft;
    const maxScroll = locationButtons.scrollWidth - locationButtons.clientWidth;

    scrollLeftBtn.style.display = scrollLeft > 0 ? 'flex' : 'none';
    scrollRightBtn.style.display = scrollLeft < maxScroll - 1 ? 'flex' : 'none';
  }

  // Update on scroll
  locationButtons.addEventListener('scroll', updateScrollButtons);
  
  // Update on load and resize
  window.addEventListener('load', updateScrollButtons);
  window.addEventListener('resize', updateScrollButtons);
  
  // Initial check
  updateScrollButtons();
});

// Re-initialize on Turbo navigation
document.addEventListener('turbo:load', function() {
  const locationButtons = document.querySelector('.location-buttons');
  const scrollLeftBtn = document.querySelector('.location-scroll-left');
  const scrollRightBtn = document.querySelector('.location-scroll-right');

  if (!locationButtons) return;

  function updateScrollButtons() {
    if (!scrollLeftBtn || !scrollRightBtn) return;
    
    const scrollLeft = locationButtons.scrollLeft;
    const maxScroll = locationButtons.scrollWidth - locationButtons.clientWidth;

    scrollLeftBtn.style.display = scrollLeft > 0 ? 'flex' : 'none';
    scrollRightBtn.style.display = scrollLeft < maxScroll - 1 ? 'flex' : 'none';
  }

  if (scrollLeftBtn) {
    scrollLeftBtn.addEventListener('click', function() {
      locationButtons.scrollBy({
        left: -200,
        behavior: 'smooth'
      });
    });
  }

  if (scrollRightBtn) {
    scrollRightBtn.addEventListener('click', function() {
      locationButtons.scrollBy({
        left: 200,
        behavior: 'smooth'
      });
    });
  }

  locationButtons.addEventListener('scroll', updateScrollButtons);
  updateScrollButtons();
});

