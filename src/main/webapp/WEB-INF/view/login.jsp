<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>ログイン</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Arvo:400" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container-fluid border_container">
  <div class="row">
    <%@ include file="header.jsp"%>
    <main class="main_content col-lg-10">
      <div id="mypage">
        <div class="login">
        	<h1>ログイン</h1>
        	<c:if test="${!empty error}">
        		<p>${error}</p>
        	</c:if>
        	<form action="" method="post">
                <div><p>ID：</p><input type="text"name="id"></div>
        		<div><p>PASS：</p><input type="text" name="pass"></div>
        		<p><input type="submit" value="ログイン"></p>
        	</form>
            <p><a href="register">会員登録がまだの方はこちら</a></p>
        </div>
      </div>
            <footer>
          <div class="container-fluid">
              <div class="scroll-infinity">
                  <div class="scroll-infinity__wrap">
                      <ul class="scroll-infinity__list scroll-infinity__list--left">
                          <li class="scroll-infinity__item"><img src="images/animal4.jpg" /></li>
                          <li class="scroll-infinity__item"><img src="images/animal8.jpg" /></li>
                          <li class="scroll-infinity__item"><img src="images/animal5.jpg" /></li>
                          <li class="scroll-infinity__item"><img src="images/animal9.jpg" /></li>
                          <li class="scroll-infinity__item"><img src="images/animal10.jpg" /></li>
                          <li class="scroll-infinity__item"><img src="images/animal3.jpg" /></li>
                      </ul>
                      <ul class="scroll-infinity__list scroll-infinity__list--left">
                          <li class="scroll-infinity__item"><img src="images/animal4.jpg" /></li>
                          <li class="scroll-infinity__item"><img src="images/animal8.jpg" /></li>
                          <li class="scroll-infinity__item"><img src="images/animal5.jpg" /></li>
                          <li class="scroll-infinity__item"><img src="images/animal9.jpg" /></li>
                          <li class="scroll-infinity__item"><img src="images/animal10.jpg" /></li>
                          <li class="scroll-infinity__item"><img src="images/animal3.jpg" /></li>
                      </ul>
                  </div>
              </div>
          </div>
          <img src="images/logo2.svg" alt="">
          <div class="container-fluid text-center pt-4 pb-2">
              <p><small>copy Okubo Citizen Zoo All Rights Reserved.</small></p>
          </div>
      </footer>
    </main>
  </div>
</div>
</body>
</html>