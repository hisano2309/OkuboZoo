<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<title>マイページ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Arvo:400" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- モーダルのHTML -->
<div class="modal" tabindex="-1" id="messageModals" data-message="<%= session.getAttribute("message") %>">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <p id="messageText"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">閉じる</button>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid border_container">
  <div class="row">
    <%@ include file="header.jsp"%>
    <main class="main_content col-lg-10">
      <div id="mypage">
        <div class="breadcrumbs">
          <a href="index">トップページ</a> > マイページ
        </div>
        <h1>マイページ</h1>
        <div class="profile">
        <img src="images/profile.jpg" >
          <p class="name">
            <c:out value="${user.loginId}" />さん
          </p>
        </div>
        <p class="my_totalpoint">
          所持ポイント：<c:out value="${totalPoint}" />pt
        </p>
        <c:if test="${empty gachaError}">
          <p class="notice">
            <a href="gacha">
              <span>★ ログインボーナス ★　<br class="pc_hidden">ガチャチケットが届いています！</span>
              <span>ガチャを回す</span>
            </a>
          </p>
        </c:if>
        <c:if test="${not empty pointError}">
          <p>${pointError}</p>
        </c:if>

        <h2>ポイントと交換</h2>
        <div class="item_wrap my_point">
          <c:forEach var="item" items="${items}">
            <form action="mypage" method="post" class="form" onsubmit="return false">
              <div class="item">
                <img
                  src="${pageContext.request.contextPath}/images/${item.imagePath}.jpg"
                  alt="${item.name}" />
                <p class="${item.name}">${item.name}</p>
                <p class="pt">${item.requiredPoint}pt</p>
                <input type="hidden" name="item" value="${item.id}">
                <input type="hidden" name="itemName" value="${item.id}">
                <input type="submit" value="交換する">
              </div>
            </form>
          </c:forEach>
        </div>

        <h2>取得したアイテム</h2>
        <div class="item_wrap my_get">
          <c:forEach var="item" items="${userItems}">
            <div class="item">
              <img
                src="${pageContext.request.contextPath}/images/${item.imagePath}.jpg"
                alt="${item.name}" />
              <div class="item_text">
                <p><fmt:formatDate value="${item.created}" pattern="yyyy/MM/dd" /></p>
                <p>${item.name}</p>
              </div>
            </div>
          </c:forEach>
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
<!-- BootstrapのJavaScriptの読み込み -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
<script src="js/script.js"></script>

</body>
</html>