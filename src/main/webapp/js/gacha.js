// DOM要素の取得
const gacha = document.querySelector('.gacha');
const gachaWrap = document.querySelector('.gacha_wrap');
const handle = document.querySelector('.gacha .handle');
const capsule = document.querySelector('.capsule_inner');
const capsuleWhite = document.querySelector('.capsule_white');
const lightup = document.querySelector('.gacha .lightup');
const shutter = document.querySelector('.shutter');
const door = document.querySelector('.door');

// アニメーションの定義
const animations = {
  bounceInDown: [
    { transform: 'translate3d(0,-3000px,0)', opacity: 0 },
    { transform: 'translate3d(0,25px,0)', opacity: 1 },
    { transform: 'translate3d(0,-10px,0)' },
    { transform: 'translate3d(0,30px,0)' },
    { transform: 'translateZ(0)' }
  ],
  rotate: [
    { transform: 'rotate(0deg)' },
    { transform: 'rotate(180deg)' }
  ],
  open: [
    { transform: 'scaleY(1)' },
    { transform: 'scaleY(0)' }
  ],
  capsule: [
    { transform: 'scale(1)', opacity: 0 },
    { transform: 'scale(1)', opacity: 1 },
    { transform: 'scale(3) rotate(145deg) translate(50%)', opacity: 1 },
    { transform: 'scale(6) rotate(60deg) translate(-40%, 20%)', opacity: 1 },
    { transform: 'scale(6) rotate(60deg) translate(-40%, 20%)', opacity: 1 },
    { transform: 'scale(6) rotate(60deg) translate(-40%, 20%)', opacity: 1 },
    { transform: 'scale(6) rotate(60deg) translate(-40%, 20%)', opacity: 0 }
  ],
  capsuleOpen: [
    { transform: 'rotate(0deg)' },
    { transform: 'rotate(85deg)' }
  ],
  lightup: [
    { transform: 'scale(1)', opacity: 0 },
    { transform: 'scale(80)', opacity: 1 }
  ],
  shutter: [
    { transform: 'scaleY(1)', opacity: 1 },
    { transform: 'scaleY(1)', opacity: 1 },
    { transform: 'scaleY(0)', opacity: 1 }
  ],
  gachaHidden: [
    { display: 'none' }
  ]
};

// アニメーションの適用
gacha.animate(animations.bounceInDown, { duration: 1000, fill: 'both' });
handle.animate(animations.rotate, { duration: 600, delay: 1200, fill: 'both' });
door.animate(animations.open, { duration: 500, delay: 2000, fill: 'both' });
capsule.animate(animations.capsule, { duration: 3800, delay: 2200, fill: 'both' });
capsuleWhite.animate(animations.capsuleOpen, { duration: 500, delay: 4500, fill: 'both' });
lightup.animate(animations.lightup, { duration: 900, delay: 5400, fill: 'both' });
shutter.animate(animations.shutter, { duration: 1000, delay: 6200 });

// アニメーションの適用
const lightupAnimation = lightup.animate(animations.lightup, { duration: 900, delay: 5400, fill: 'both' });

// lightupのアニメーションが終了したときに gacha を非表示にする
lightupAnimation.onfinish = () => {
  gachaWrap.style.display = 'none';
};