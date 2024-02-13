document.addEventListener('DOMContentLoaded', function() {
    // Smooth scrolling for nav links
    document.querySelectorAll('nav a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Handle form submissions
    const quoteForm = document.querySelector('#quote form');
    const uploadForm = document.querySelector('#uploadLogs form');

    quoteForm.addEventListener('submit', function(e) {
        e.preventDefault();
        alert('Quote request submitted. We will get back to you shortly!');
        quoteForm.reset();
    });

    uploadForm.addEventListener('submit', function(e) {
        e.preventDefault();
        alert('Flight log uploaded successfully. Your discount will be applied!');
        uploadForm.reset();
    });

    // Set drone company for upload on button click
    document.querySelectorAll('.upload-button').forEach(button => {
        button.addEventListener('click', function() {
            const company = this.getAttribute('data-company');
            const companySelect = document.querySelector('#uploadLogs select[name="company"]');
            companySelect.value = company;
            document.querySelector('#uploadLogs').scrollIntoView({
                behavior: 'smooth'
            });
        });
    });
});
