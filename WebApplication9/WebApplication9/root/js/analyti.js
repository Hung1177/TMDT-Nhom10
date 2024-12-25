document.addEventListener("DOMContentLoaded", () => {
    const ctxOrders = document.getElementById('ordersChart').getContext('2d');
    const ctxProfit = document.getElementById('profitChart').getContext('2d');
    const ctxStatus = document.getElementById('statusChart').getContext('2d');

    // Biểu đồ đơn hàng theo tháng
    new Chart(ctxOrders, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            datasets: [{
                label: 'Đơn hàng',
                data: [30, 45, 60, 70, 90, 120, 150, 130, 170, 200, 220, 250],
                borderColor: 'rgba(54, 162, 235, 1)',
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                tension: 0.4,
                fill: true
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true
                }
            }
        }
    });

    // Biểu đồ lợi nhuận
    new Chart(ctxProfit, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            datasets: [{
                label: 'Lợi nhận',
                data: [1000, 1200, 1500, 2000, 2500, 3000, 4000, 3500, 4500, 5000, 6000, 7000],
                backgroundColor: 'rgba(75, 192, 192, 0.6)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true
                }
            }
        }
    });

    // Biểu đồ tình trạng đơn hàng
    new Chart(ctxStatus, {
        type: 'pie',
        data: {
            labels: ['Chờ xác nhận', 'Đang xử lý', 'Hoàn thành', 'Hủy bỏ'],
            datasets: [{
                label: 'Order Status',
                data: [200, 50, 100, 10],
                backgroundColor: [
                    'rgba(230, 214, 78, 0.6)',
                    'rgba(240, 141, 11, 0.6)',
                    'rgba(19, 241, 11, 0.6)',
                    'rgba(238, 20, 20, 0.6)'
                ],
                borderColor: [
                    'rgba(230, 214, 78, 0.6)',
                    'rgba(240, 141, 11, 0.6)',
                    'rgba(19, 241, 11, 0.6)',
                    'rgba(238, 20, 20, 0.6)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top'
                }
            }
        }
    });
    // Dữ liệu giả lập (thay bằng dữ liệu thực tế từ backend)
    const topProductsData = {
        labels: ['Sản phẩm A', 'Sản phẩm B', 'Sản phẩm C', 'Sản phẩm D', 'Sản phẩm E'],
        datasets: [{
            label: 'Số lượng đặt',
            data: [150, 120, 90, 70, 50], // Thay bằng dữ liệu thực tế
            backgroundColor: [
                'rgba(255, 99, 132, 0.5)',
                'rgba(54, 162, 235, 0.5)',
                'rgba(255, 206, 86, 0.5)',
                'rgba(75, 192, 192, 0.5)',
                'rgba(153, 102, 255, 0.5)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    };

    // Cấu hình biểu đồ
    const topProductsConfig = {
        type: 'bar', // Kiểu biểu đồ: cột
        data: topProductsData,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Sản phẩm được đặt nhiều nhất'
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    };

    // Khởi tạo biểu đồ
    const topProductsChart = new Chart(
        document.getElementById('topProductsChart'),
        topProductsConfig
    );

});
document.addEventListener('DOMContentLoaded', () => {
    const pages = document.querySelectorAll('.charts-page');
    let currentPage = 0;

    document.getElementById('prev-btn').addEventListener('click', () => {
        pages[currentPage].classList.remove('active');
        currentPage = (currentPage - 1 + pages.length) % pages.length;
        pages[currentPage].classList.add('active');
    });

    document.getElementById('next-btn').addEventListener('click', () => {
        pages[currentPage].classList.remove('active');
        currentPage = (currentPage + 1) % pages.length;
        pages[currentPage].classList.add('active');
    });

    // Initialize charts
    const ordersCtx = document.getElementById('ordersChart').getContext('2d');
    const profitCtx = document.getElementById('profitChart').getContext('2d');
    const statusCtx = document.getElementById('statusChart').getContext('2d');

    // Example data
    const ordersChart = new Chart(ordersCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
            datasets: [{ label: 'Orders', data: [10, 20, 30, 40, 50], backgroundColor: 'rgba(108, 155, 207, 0.2)', borderColor: 'rgba(108, 155, 207, 1)' }]
        }
    });

    const profitChart = new Chart(profitCtx, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
            datasets: [{ label: 'Profit', data: [500, 600, 700, 800, 900], backgroundColor: 'rgba(27, 156, 133, 0.6)' }]
        }
    });

    const statusChart = new Chart(statusCtx, {
        type: 'doughnut',
        data: {
            labels: ['Completed', 'Cancelled', 'Pending'],
            datasets: [{ data: [70, 20, 10], backgroundColor: ['#6C9BCF', '#FF0060', '#F7D060'] }]
        }
    });
});

