<%@ page pageEncoding="UTF-8"%>
<header>
	<h1 class="logo pc_hidden">
		<a href="index"><img src="images/logo2.svg"></a>
	</h1>
	<h1 class="logo sp_hidden">
		<a href="index"><img src="images/logo1.svg"></a>
	</h1>
	<nav class="pc_nav sp_hidden col-2">
		<c:if test="${user == null}">
			<ul class="nav-list login">
				<li><a href="register">新規登録</a></li>
				<li><a href="login">ログイン</a></li>
			</ul>
		</c:if>
		<c:if test="${user != null}">
			<ul class="nav-list login">
				<li><a href="mypage">マイページ</a></li>
				<li>
					<form action="logout" method="post">
						<input type="submit" value="ログアウト">
					</form>
				</li>
			</ul>
		</c:if>
		<ul class="nav-list">
			<li><a href="index">TOP<br>
				<span>トップページ</span></a></li>
			<li><a href="index#news">NEWS<br>
				<span>新着情報</span></a></li>
			<li><a href="index#animal">ANIMAL<br>
				<span>動物たち</span></a></li>
			<li><a href="index#access">ACCESS<br>
				<span>交通アクセス</span></a></li>
		</ul>
		<div class="nav-sns">
			<p>Official SNS</p>
			<ul class="sns">
				<li><a href="index"><img src="images/icon_twitter_white.svg"></a></li>
				<li><a href="index"><img src="images/icon_instagram_white.svg"></a></li>
				<li><a href="index"><img src="images/icon_facebook_white.svg"></a></li>
			</ul>
		</div>
	</nav>
	<nav class="sp_nav pc_hidden" id="js-nav">
		<c:if test="${user == null}">
			<ul class="nav-list login">
				<li><a class="nav-item" href="register">新規登録</a></li>
				<li><a class="nav-item" href="login">ログイン</a></li>
			</ul>
		</c:if>
		<c:if test="${user != null}">
			<ul class="nav-list login">
				<li><a class="nav-item" href="mypage">マイページ</a></li>
				<li>
					<form action="logout" method="post">
						<input class="nav-item" type="submit" value="ログアウト">
					</form>
				</li>
			</ul>
		</c:if>
		<hr>
		<ul class="nav-list">
            <li><a class="nav-item" href="index">TOP<br>
                <span>トップページ</span></a></li>
			<li><a class="nav-item" href="index#news">NEWS<br>
				<span>新着情報</span></a></li>
			<li><a class="nav-item" href="index#animal">ANIMAL<br>
				<span>動物たち</span></a></li>
			<li><a class="nav-item" href="index#access">ACCESS<br>
				<span>交通アクセス</span></a></li>
		</ul>
		<div class="nav-sns">
			<p>Official SNS</p>
			<ul class="sns">
				<li><a href="index"><img src="images/icon_twitter_white.svg"></a></li>
				<li><a href="index"><img src="images/icon_instagram_white.svg"></a></li>
				<li><a href="index"><img src="images/icon_facebook_white.svg"></a></li>
			</ul>
		</div>
	</nav>
	<button class="hamburger" id="js-hamburger">
		<span></span> <span></span> <span></span>
	</button>
</header>