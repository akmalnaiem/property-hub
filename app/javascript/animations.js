// Smooth scroll animations and interactions
document.addEventListener('DOMContentLoaded', function() {
  initAnimations();
});

document.addEventListener('turbo:load', function() {
  initAnimations();
});

function initAnimations() {
  // Intersection Observer for fade-in animations
  const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
  };

  const observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.style.opacity = '1';
        entry.target.style.transform = 'translateY(0)';
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  // Observe property cards
  document.querySelectorAll('.property-card').forEach((card, index) => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(30px)';
    card.style.transition = `opacity 0.6s ease-out ${index * 0.1}s, transform 0.6s ease-out ${index * 0.1}s`;
    observer.observe(card);
  });

  // Observe blog cards and other elements with animate-on-scroll class
  document.querySelectorAll('.animate-on-scroll').forEach((element, index) => {
    // Set CSS variable for animation delay if data-card-index exists
    if (element.dataset.cardIndex !== undefined) {
      element.style.setProperty('--card-index', element.dataset.cardIndex);
    }
    
    if (!element.style.opacity) {
      element.style.opacity = '0';
      element.style.transform = 'translateY(30px)';
      const delay = element.dataset.cardIndex ? parseFloat(element.dataset.cardIndex) * 0.1 : index * 0.1;
      element.style.transition = `opacity 0.6s ease-out ${delay}s, transform 0.6s ease-out ${delay}s`;
      observer.observe(element);
    }
  });

  // Parallax effect for hero image
  const heroImage = document.querySelector('.hero-image');
  if (heroImage) {
    window.addEventListener('scroll', function() {
      const scrolled = window.pageYOffset;
      const parallax = scrolled * 0.3;
      heroImage.style.transform = `translateY(${parallax}px)`;
    });
  }

  // Add ripple effect to buttons
  document.querySelectorAll('.view-btn, .location-btn, .add-property-btn, .ripple-effect').forEach(button => {
    button.addEventListener('click', function(e) {
      const ripple = document.createElement('span');
      const rect = this.getBoundingClientRect();
      const size = Math.max(rect.width, rect.height);
      const x = e.clientX - rect.left - size / 2;
      const y = e.clientY - rect.top - size / 2;
      
      ripple.style.width = ripple.style.height = size + 'px';
      ripple.style.left = x + 'px';
      ripple.style.top = y + 'px';
      ripple.classList.add('ripple');
      
      this.appendChild(ripple);
      
      setTimeout(() => {
        ripple.remove();
      }, 600);
    });
  });

  // Counter animation for stats (both hero and about page)
  const statNumbers = document.querySelectorAll('.stat-number[data-target]');
  if (statNumbers.length > 0) {
    const statsObserver = new IntersectionObserver(function(entries) {
      entries.forEach(entry => {
        if (entry.isIntersecting && !entry.target.classList.contains('counted')) {
          entry.target.classList.add('counted');
          const target = parseInt(entry.target.getAttribute('data-target'));
          animateCounter(entry.target, target);
          statsObserver.unobserve(entry.target);
        }
      });
    }, { threshold: 0.5 });

    statNumbers.forEach(stat => {
      statsObserver.observe(stat);
    });
  }
}

// Counter animation function
function animateCounter(element, target) {
  const duration = 2000; // 2 seconds
  const start = 0;
  const increment = target / (duration / 16); // 60fps
  let current = start;

  const timer = setInterval(() => {
    current += increment;
    if (current >= target) {
      element.textContent = target;
      clearInterval(timer);
    } else {
      element.textContent = Math.floor(current);
    }
  }, 16);
}

// Add ripple effect styles
const style = document.createElement('style');
style.textContent = `
  .view-btn, .location-btn, .add-property-btn, .ripple-effect {
    position: relative;
    overflow: hidden;
  }
  
  .ripple {
    position: absolute;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.6);
    transform: scale(0);
    animation: ripple-animation 0.6s ease-out;
    pointer-events: none;
  }
  
  @keyframes ripple-animation {
    to {
      transform: scale(4);
      opacity: 0;
    }
  }
`;
document.head.appendChild(style);

