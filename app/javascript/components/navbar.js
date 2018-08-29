function initUpdateNavbarOnScroll() {
  const map = document.querySelector('.map');
  if (map) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 30) {
        map.classList.add('full');
      } else {
        map.classList.remove('full');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
