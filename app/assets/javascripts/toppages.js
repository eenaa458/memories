// スライド1枚あたりの幅（px）
const slideWidth = 1000;

// 現在表示中のスライドが何番目か（0から数え始める）
let currentSlide = 0;

// スライドの全枚数
let numSlides;

// index（0から始まる）番目のスライドを表示する関数
const showSlide = (index) => {
  // 1番目のスライドでは左矢印を非表示
  if (index === 0) {
    $('.carousel-control-prev').hide();
  } else {
    $('.carousel-control-prev').show();
  }

  // 最後のスライドでは右矢印を非表示
  if (index === numSlides - 1) {
    $('.carousel-control-next').hide();
  } else {
    $('.carousel-control-next').show();
  }

  // 実行中のアニメーションがあればキャンセルした後、
  // leftを変化させるアニメーションを開始
  $('.slides')
    .stop()
    .animate(
      {
        left: `${-slideWidth * currentSlide}px`,
      },
      600,
    );
};

// 左矢印がクリックされたら1つ前のスライドを表示
$('.carousel-control-prev').on('click', (e) => {
  e.preventDefault();

  currentSlide -= 1;
  showSlide(currentSlide);
});

// 右矢印がクリックされたら1つ後のスライドを表示
$('.carousel-control-next').on('click', (e) => {
  e.preventDefault();

  currentSlide += 1;
  showSlide(currentSlide);
});

// スライドが全部で何枚あるか取得
numSlides = $('.slides > li').length;

// 最初のスライドを表示
showSlide(currentSlide);