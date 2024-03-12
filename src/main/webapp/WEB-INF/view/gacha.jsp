<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログインボーナスガチャ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<c:if test="${empty gachaError}">
    <div class="gacha_wrap">
        <div class="gacha">
            <p class="door"></p>
            <img class="bg" src="images/gacha.png" alt="">
            <img class="handle" src="images/handle.png" alt="">
            <p class="lightup"></p>
            <div class="capsule">
                <div class="capsule_inner">
                    <img class="capsule_white" src="images/capsule_white.png" alt="">
                    <img class="capsule_red" src="images/capsule_red.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="shutter"></div>
    <div class="point_wrap">
        <div class="line-container"></div>
        <p class="result">
          <img src="images/point.svg">
          <span><c:out value="${point}" />pt</span> が<br>当たりました！
        </p>
        <p><a href="mypage">マイページへ戻る</a></p>
    </div>
</c:if>
<c:if test="${not empty gachaError}">
    <div class="point_wrap">
      <p class="error">${gachaError}</p>
        <p><a href="mypage">マイページへ戻る</a></p>
    </div>
</c:if>
    <script src="js/gacha.js"></script>
</body>
</html>