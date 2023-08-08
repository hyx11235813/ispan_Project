<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>我的電子郵件應用</title>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
        body {
            background-color: #f8f8f8;
            color: #333;
            padding: 20px;
        }
        /* 標題樣式 */
        h1 {
            text-align: center;
            margin-top: 50px;
            margin-bottom: 30px;
            font-size: 32px;
        }
    /* 表格樣式 */
    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 30px;
        border: 1px solid #ddd;

    }

    th, td {
        text-align: left;
        padding: 8px;
        border: 1px solid #ddd;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    /* 模態框樣式 */
    .modal {
        display: none; /* 預設隱藏 */
        position: fixed; /* 固定定位 */
        z-index: 1; /* 確保模態框出現在其他元素上方 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4); /* 背景顏色及不透明度 */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        opacity: 0;
        transition: opacity 0.3s ease-in-out;
    }

        .modal.show {
            /* display: block; */
            opacity: 1;
        }

    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }

    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    /* 表單樣式 */
    form {
        margin-top: 30px;
        padding: 20px;
        background-color: #f2f2f2;
        border-radius: 4px;
    }

    label {
        display: inline-block;
        width: 120px;
        margin-right: 10px;
    }

    input[type="text"],
    input[type="email"],
    textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
    }

    button[type="submit"],
    button {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    button[type="submit"]:hover,
    button:hover    {
        background-color: #0069d9;
        color: white;
    }
        thead {
            border-bottom: 2px solid #007bff;
        }

        tbody tr:last-child td {
            border-bottom: 2px solid #ddd;
        }
        button {
            display: inline-block;
            margin-right: 5px;
            margin-bottom: 5px;
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0069d9;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
            transform: translateY(-2px);
        }


        /* 响應式設計 */
    @media screen and (max-width: 600px) {
        /* 表格樣式 */
        th, td {
            display: block;
        }

        tr {
            margin-bottom: 30px;
        }

        th:first-child, td:first-child {
            padding-top: 12px;
        }

        th:last-child, td:last-child {
            padding-bottom: 12px;
        }

        /* 表單樣式 */
        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            margin-bottom: 10px;
        }
    }
</style>
    </head>
<body onload="getAllEmails()">
    <h1>電子郵件</h1>
    <table>
    <thead>
        <tr>
            <th>ID</th>
            <th>姓名</th>
            <th>電子郵件</th>
            <th>電話</th>
            <th>時間</th>
            <th>訊息</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody th:each="email : ${emails}">
        <tr>
            <td th:text="${email.id}"></td>
            <td th:text="${email.name}"></td>
            <td th:text="${email.email}"></td>
            <td th:text="${email.phoneNumber}"></td>
            <td th:text="${email.createdDate}"></td>
            <td th:text="${email.message}"></td>
            <td>
                <button onclick="getEmailById(${email.id})"><i class="fas fa-edit"></i> 編輯</button>
                <button onclick="deleteEmail(${email.id})"><i class="fas fa-trash-alt"></i> 刪除</button>
            </td>
        </tr>
    </tbody>
</table>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>更新電子郵件</h2>
        <form id="update-form">
            <input type="hidden" name="id" >

            <label>姓名:</label>
            <input type="text" name="name">

            <label>電子郵件:</label>
            <input type="email" name="email">

            <label>訊息:</label>
            <textarea name="message"></textarea>

            <button type="submit"><i class="fas fa-save"></i> 更新</button>
        </form>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="app.js"></script>
<script>
    // 获取所有电子邮件记录
    function getAllEmails() {
        $.ajax({
            url: '${contextRoot}/emails',
            type: 'GET',
            success: function(data) {
            var emails = data;
            for (var i = 0; i < emails.length; i++) {
            var email = emails[i];
            $('table tbody').append('<tr><td>' + email.id + '</td><td>' + email.name + '</td><td>' + email.email + '</td><td>' + email.phoneNumber + '</td><td>' + email.createdDate + '</td><td>' + email.message + '</td><td><button onclick="getEmailById(' + email.id + ')"><i class="fas fa-edit"></i> 編輯</button> <button onclick="deleteEmail(' + email.id + ')"><i class="fas fa-trash-alt"></i> 刪除</button></td></tr>');
            }
            }
            });
            }
    // 获取单个电子邮件记录
    function getEmailById(id) {
        $.ajax({
            url: '${contextRoot}/emails/' + id,
            type: 'GET',
            success: function(data) {
                $('#update-form input[name="id"]').val(data.id);
                $('#update-form input[name="name"]').val(data.name);
                $('#update-form input[name="email"]').val(data.email);
                $('#update-form input[name="phoneNumber"]').val(data.phoneNumber);
                $('#update-form input[name="createdDate"]').val(data.createdDate);
                $('#update-form textarea[name="message"]').val(data.message);
              

                // 显示模态框	
                var modal = document.getElementById("myModal");
                modal.classList.add("show");
                modal.style.display = "block";

                // 当用户点击模态框关闭按钮或模态框外部区域，关闭模态框
                var closeButton = document.getElementsByClassName("close")[0];
                closeButton.onclick = function() {
                    modal.style.display = "none";
                };
                window.onclick = function(event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            }
        });
    }

    // 更新现有的电子邮件记录
    function updateEmail(event) {
        event.preventDefault();
        var id = $('#update-form input[name="id"]').val();
        var name = $('#update-form input[name="name"]').val();
        var email = $('#update-form input[name="email"]').val();
        var phoneNumber = $('#update-form input[name="phoneNumber"]').val();
        var createdDate = $('#update-form input[name="createdDate"]').val();
        var message = $('#update-form textarea[name="message"]').val();
        var data = {
            'id': id,
            'name': name,
            'email': email,
            'message': message,
            'phoneNumber': phoneNumber,
            'createdDate': createdDate
        };
        $.ajax({
            url: '${contextRoot}/emails/' + id,
            type: 'PUT',
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function(data) {
                console.log(data);
                $('table tbody').empty();
                getAllEmails();

                // 关闭模态框
                var modal = document.getElementById("myModal");
                modal.style.display = "none";
            }
        });
    }

    // 删除电子邮件记录
    function deleteEmail(id) {
        if (confirm("確定要刪除這條電子郵件記錄嗎？")){
        $.ajax({
            url: '${contextRoot}/emails/' + id,
            type: 'DELETE',
            success: function(data) {
                console.log(data);
                $('table tbody').empty();
                getAllEmails();
            }
        });
    }
    }

    $(document).ready(function() {
       /*  // 页面加载时获取所有电子邮件记录
        getAllEmails(); */

        // 添加电子邮件记录
        $('#add-form').submit(function(event) {
            event.preventDefault();
            var name = $('#add-form input[name="name"]').val();
            var email = $('#add-form input[name="email"]').val();
            var phoneNumber = $('#add-form input[name="phoneNumber"]').val();
            var createdDate = $('#add-form input[name="createdDate"]').val();
            var message = $('#add-form textarea[name="message"]').val();
            var data = {
                'name': name,
                'email': email,
                'phoneNumber': phoneNumber,
                'message': message,
                'createdDate': createdDate
            };
            $.ajax({
                url:'${contextRoot}/emails/',
                type: 'POST',
                data: JSON.stringify(data),
                contentType: 'application/json',
                success: function(data) {
                console.log(data);
                $('table tbody').empty();
                getAllEmails();
                }
                });
                });
        // 更新电子邮件记录
        $('#update-form').submit(updateEmail);

        // 当用户点击模态框外部区域，关闭模态框
        var modal = document.getElementById("myModal");
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    });
    function paginate(data, pageSize, currentPage) {
        let startIndex = (currentPage - 1) * pageSize;
        let endIndex = startIndex + pageSize;
        return data.slice(startIndex, endIndex);
    }
</script>
</body>
</html>

        