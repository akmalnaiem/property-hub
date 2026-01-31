// ShadboxProperty.com style navbar functionality
document.addEventListener('DOMContentLoaded', function() {
  initReraNavbar();
});

document.addEventListener('turbo:load', function() {
  initReraNavbar();
});

function initReraNavbar() {
  // Mobile dropdown toggle for secondary nav
  const secondaryNavLinks = document.querySelectorAll('.rera-secondary-nav-link');
  
  secondaryNavLinks.forEach(link => {
    const dropdown = link.closest('.rera-nav-dropdown');
    if (dropdown && window.innerWidth <= 768) {
      link.addEventListener('click', function(e) {
        const menu = dropdown.querySelector('.rera-dropdown-menu');
        if (menu) {
          e.preventDefault();
          // Close other dropdowns
          document.querySelectorAll('.rera-nav-dropdown').forEach(d => {
            if (d !== dropdown) {
              d.classList.remove('active');
            }
          });
          // Toggle current dropdown
          dropdown.classList.toggle('active');
        }
      });
    }
  });

  // Close dropdowns when clicking outside
  document.addEventListener('click', function(e) {
    if (!e.target.closest('.rera-nav-dropdown')) {
      document.querySelectorAll('.rera-nav-dropdown').forEach(dropdown => {
        dropdown.classList.remove('active');
      });
    }
  });
}

