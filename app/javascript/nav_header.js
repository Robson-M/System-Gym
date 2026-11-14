document.addEventListener("click", (event) => {
    const openMenus = document.querySelectorAll('.top-header details[open]');
    
    openMenus.forEach((menu) => {
        if (!menu.contains(event.target)) {
            menu.removeAttribute("open");
        }
    });
});