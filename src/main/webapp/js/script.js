// ハンバーガーメニュー
const ham = document.querySelector('#js-hamburger');
const nav = document.querySelector('#js-nav');

ham.addEventListener('click', function() {
	ham.classList.toggle('active');
	nav.classList.toggle('active');
});

// メッセージをモーダルに表示する
const form = document.querySelectorAll(".form");
form.forEach(e => {
	e.addEventListener('submit', function() {
		const childMessage = e.children[0].children[1].className;
		console.log(childMessage);
		var messageModal = document.getElementById('messageModals');
		var message = childMessage+"を交換しました";

		if (message) {
			document.getElementById('messageText').textContent = message;

			var bootstrapModal = new bootstrap.Modal(messageModal);
			bootstrapModal.show();

			messageModal.addEventListener('hidden.bs.modal', function() {
				e.submit();
			});
		}
	});
});





// FVスライド
const slide = document.getElementById('slide');
const indicator = document.getElementById('indicator');
const lists = document.querySelectorAll('.list');
const totalSlides = lists.length;
let count = 0;
let autoPlayInterval;
function updateListBackground() {
	for (let i = 0; i < lists.length; i++) {
		lists[i].style.backgroundColor = i === count % totalSlides ? '#35aaad' : '#fff';
	}
}
function nextClick() {
	slide.classList.remove(`slide${count % totalSlides + 1}`);
	count++;
	slide.classList.add(`slide${count % totalSlides + 1}`);
	updateListBackground();
}
function prevClick() {
	slide.classList.remove(`slide${count % totalSlides + 1}`);
	count--;
	if (count < 0) count = totalSlides - 1;
	slide.classList.add(`slide${count % totalSlides + 1}`);
	updateListBackground();
}
function startAutoPlay() {
	autoPlayInterval = setInterval(nextClick, 4000);
}
function resetAutoPlayInterval() {
	clearInterval(autoPlayInterval);
	startAutoPlay();
}
indicator.addEventListener('click', (event) => {
	if (event.target.classList.contains('list')) {
		const index = Array.from(lists).indexOf(event.target);
		slide.classList.remove(`slide${count % totalSlides + 1}`);
		count = index;
		slide.classList.add(`slide${count % totalSlides + 1}`);
		updateListBackground();
		resetAutoPlayInterval();
	}
});
startAutoPlay();

