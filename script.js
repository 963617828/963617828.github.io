// 移动菜单切换
document.addEventListener('DOMContentLoaded', function() {
    const menuToggle = document.querySelector('.mobile-menu-toggle');
    const nav = document.querySelector('nav');
    
    if (menuToggle && nav) {
        menuToggle.addEventListener('click', function() {
            nav.classList.toggle('active');
        });
    }
}); 

// 添加到现有script标签内
function setActiveNav(element, type) {
    // 移除所有导航项的active类
    document.querySelectorAll('.top-nav-item').forEach(item => {
        item.classList.remove('active');
    });
    // 给被点击的导航项添加active类
    element.classList.add('active');
    
    // 切换内容显示
    const isLinux = element.textContent === 'Linux';
    const isMySQL = element.textContent === 'MySQL';
    const isFiles = type === 'files';
    
    document.getElementById('linux-commands-content').style.display = isLinux ? 'block' : 'none';
    document.getElementById('mysql-content').style.display = isMySQL ? 'block' : 'none';
    document.getElementById('files-content').style.display = isFiles ? 'block' : 'none';
    
    document.getElementById('linux-sidebar').style.display = isLinux ? 'block' : 'none';
    document.getElementById('mysql-sidebar').style.display = isMySQL ? 'block' : 'none';
    
    // 控制左侧导航栏显示
    document.getElementById('linux-nav').style.display = isLinux ? 'block' : 'none';
    document.getElementById('mysql-nav').style.display = isMySQL ? 'block' : 'none';
    document.getElementById('files-nav').style.display = isFiles ? 'block' : 'none';
}

// 添加 MySQL 脚本点击事件
document.addEventListener('DOMContentLoaded', function() {
    // ... existing code ...
    
    // 添加 MySQL 脚本点击事件
    const mysqlScriptsLink = document.getElementById('mysql-scripts');
    if (mysqlScriptsLink) {
        mysqlScriptsLink.addEventListener('click', function(e) {
            e.preventDefault();
            
            // 显示 SQL 文件列表，隐藏所有 SQL 文件内容
            document.getElementById('mysql-scripts-content').style.display = 'block';
            document.querySelectorAll('.sql-file-content').forEach(content => {
                content.style.display = 'none';
            });
        });
    }
    
    // 添加 SQL 文件项点击事件
    document.querySelectorAll('.sql-file-item').forEach(item => {
        item.addEventListener('click', function() {
            const fileId = this.getAttribute('data-file');
            
            // 特殊处理 ooowakaka.sql 文件下载
            if (fileId === 'ooowakaka') {
                // 创建一个临时链接并触发点击
                const link = document.createElement('a');
                link.href = 'blob:https://github.com/a404e29d-ed48-4407-90a1-343ea19249cb';
                link.download = 'ooowakaka.sql';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
                return; // 不显示内容
            }
            
            // 隐藏 SQL 文件列表，显示选中的 SQL 文件内容
            document.getElementById('mysql-scripts-content').style.display = 'none';
            document.querySelectorAll('.sql-file-content').forEach(content => {
                content.style.display = 'none';
            });
            document.getElementById(fileId).style.display = 'block';
        });
    });
}); 
