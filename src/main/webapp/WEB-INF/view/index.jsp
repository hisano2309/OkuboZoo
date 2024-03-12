<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ja">

<head>
    <meta charset="utf-8">
    <title>大久保市民動物園</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Arvo:400" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

	<c:if test="${user != null}">
		<div id="js_modal" class="top_modal">
		  <div class="js_modal_close modal_bg"></div>
		  <div class="modal_wrap">
		    <a class="js_modal_close modal_close">
		      <span></span> <span></span>
		    </a>
		    <div class="modal_inner">
		      <p>＼ ログインボーナス ／<br>ガチャチケットが届いています！</p>
		      <a href="gacha" class="modal_btn">ガチャを回す</a>
		    </div>
		  </div>
		</div>
	</c:if>

    <div class="container-fluid border_container">
        <div class="row">
	        <%@ include file = "header.jsp" %>
            <main class="main_content col-lg-10">
                <div class="fv">
                    <div class="slide-wrapper">
                        <div id="slide" class="slide">
                            <div class="first"></div>
                            <div class="second"></div>
                            <div class="third"></div>
                        </div>
                        <ul class="indicator" id="indicator">
                            <li class="list"></li>
                            <li class="list"></li>
                            <li class="list"></li>
                        </ul>
                    </div>
                    <p class="copy">大久保市民動物園</p>
                    <div class="time">
                        <p>本日の営業時間</p>
                        <p class="hour">10:00-19:00</p>
                    </div>
                    <p class="scroll">scroll</p>
                </div>
                <div class="container-fluid">
                    <div class="container news" id="news">
                        <img class="news-img img-fluid" src="images/animal11.jpg" alt="羊の群れ">
                        <h2><span class="arvo">NEWS &<br>TOPICS</span><br>イベント・新着情報</h2>
                        <div class="row row-cols-1 row-cols-lg-3">
                            <a href="#" class="col py-2 text-decoration-none">
                                <img src="images/animal12.jpg" alt="NEWS">
                                <div class="news-text">
                                    <span class="feature-date">2023.01.01</span>
                                    <p>カンガルーの赤ちゃんが生まれました！</p>
                                </div>
                            </a>
                            <a href="#" class="col py-2 text-decoration-none">
                                <img src="images/animal8.jpg" alt="NEWS">
                                <div class="news-text">
                                    <span class="feature-date">2023.01.01</span>
                                    <p>秋のイベントを開催します！<br>普段触れない動物とふれあえるチャンス！</p>
                                </div>
                            </a>
                            <a href="#" class="col py-2 text-decoration-none">
                                <img src="images/animal6.jpg" alt="NEWS">
                                <div class="news-text">
                                    <span class="feature-date">2023.01.01</span>
                                    <p>〇月〇日で開園100周年を迎えます！</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="bg-white container-fluid">
                    <div class="container animal" id="animal">
                        <h2><span class="arvo">ANIMALS</span><br>動物たち</h2>
                        <div class="main-animal pb-4 mb-5">
                            <a href="#" class="text-dark text-decoration-none row">
                                <div  class="animal-img col-12 col-lg-7">
                                    <img src="images/animal5.jpg" class="col-12" alt="パンダ">
                                    <span class="circle-right"></span>
                                </div>
                                <div class="card col-12 col-lg-5">
                                    <h3 class="card-title pt-3">パンダ</h3>
                                    <p class="card-text">一番人気の動物です。行列ができることも。<br>
                                        園内には4頭のジャイアントパンダが暮らしています。</p>
                                        <div class="alert alert-danger">
                                            現在、整理券を配布中です。詳細ページよりお求めください。
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="main-animal pb-4 mb-5">
                            <a href="#" class="text-dark text-decoration-none row">
                                <div  class="animal-img col-12 col-lg-7">
                                    <img src="images/animal7.jpg" class="col-12" alt="カピバラ">
                                    <span class="circle-right"></span>
                                </div>
                                <div class="card col-12 col-lg-5">
                                    <h3 class="card-title pt-3">カピバラ</h3>
                                    <p class="card-text">世界最大のネズミの仲間で、名前の由来は「草原の支配者」という意味からきていると言われています。指の数は前足に4本、後ろ足に3本あり、指の間には水かきがついていて泳ぎと潜水が得意です。</p>
                                </div>
                            </a>
                        </div>
                        <div class="row row-cols-2 row-cols-md-3 g-4">
                            <div class="col">
                                <a href="#" class="card h-100 text-dark text-decoration-none">
                                    <div class="animal-img">
                                        <img src="images/animal1.jpg" class="card-img-top img-fluid" alt="...">
                                        <span class="circle-right"></span>
                                    </div>
                                    <div class="card-body">
                                        <h3 class="card-title">ネコ</h3>
                                        <p class="card-text">園内を自由に走り回っています。</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col">
                                <a href="#" class="card h-100 text-dark text-decoration-none">
                                    <div class="animal-img">
                                        <img src="images/animal2.jpg" class="card-img-top img-fluid" alt="...">
                                        <span class="circle-right"></span>
                                    </div>
                                    <div class="card-body">
                                        <h3 class="card-title">ハト</h3>
                                        <p class="card-text">エサやり体験が大人気です。</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col">
                                <a href="#" class="card h-100 text-dark text-decoration-none">
                                    <div class="animal-img">
                                        <img src="images/animal3.jpg" class="card-img-top img-fluid" alt="...">
                                        <span class="circle-right"></span>
                                    </div>
                                    <div class="card-body">
                                        <h3 class="card-title">アヒル</h3>
                                        <p class="card-text">ふれあい広場にいる子供たちの人気者です。</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="custom-shape">
                        <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                            <path d="M985.66,92.83C906.67,72,823.78,31,743.84,14.19c-82.26-17.34-168.06-16.33-250.45.39-57.84,11.73-114,31.07-172,41.86A600.21,600.21,0,0,1,0,27.35V120H1200V95.8C1132.19,118.92,1055.71,111.31,985.66,92.83Z" class="shape-fill"></path>
                        </svg>
                    </div>
                </div>
                <footer>
                    <div class="container-fluid">
                        <div class="container" id="access">
                            <h2><span class="arvo">ACCESS</span><br>交通アクセス</h2>
                            <p class="mt-5">〒169-0072　東京都新宿区大久保0-0-0</p>
                            <p>西早稲田駅から徒歩５分</p>
                            <div id="map"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12959.230606404391!2d139.7161935!3d35.7063507!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xc209912588ad309e!2z5oi45bGx5YWs5ZyS!5e0!3m2!1sja!2sjp!4v1505175127919" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe></div>
                        </div>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
    <script src="js/script.js"></script>
    	<script>
		window.onload = function() {
		 
		  // cookieを配列に格納する
		  const cookieArray = new Array();
		  if(document.cookie != ''){
		    const tmp = document.cookie.split('; ');
		    for(let i=0;i<tmp.length;i++){
		      const data = tmp[i].split('=');
		      cookieArray[data[0]] = decodeURIComponent(data[1]);
		    }
		  }
		 
		  // cookieの配列からmodalBrowseを取得する
		  const modalBrowse = cookieArray["modalBrowse"];
		  const modal = document.getElementById("js_modal");
		 
		  // modalBrowseが無い場合のみモーダルを表示しつつ今日の23:59:59を期限にしたcookieをセット
		  if (!modalBrowse) {
		    modal.classList.add("is_active");
		    const date = new Date();
		    const todayEnd = new Date(date.getFullYear(), date.getMonth(), date.getDate(), 23, 59, 59);
		    const dateTime = date.getTime();
		    const todayEndTime = todayEnd.getTime();
		    const remainingTime = Math.ceil((todayEndTime - dateTime) / 500);
		    // document.cookie = 'modalBrowse=allready; max-age=' + remainingTime;
		    // ▼ 24時間後でよければ、下記１行でOK
		    document.cookie = 'modalBrowse=allready; max-age=1'; // 86400秒
		  }
		 
		  // 閉じるボタン
		  const modalClose = document.getElementsByClassName('js_modal_close');
		  for( var i = 0; i < modalClose.length; i++ ) {
		    modalClose[i].onclick = function () {
		      modal.classList.remove("is_active");
		    }
		  }
		 
		}
	</script>

</body>

</html>