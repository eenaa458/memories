// Flickr API key
const apiKey = gon.flickr_api_key;

// Flickr画像データのURLを返す
const getFlickrImageURL = (photo, size) => {
  let url = `https://farm${photo.farm}.staticflickr.com/${photo.server}/${photo.id}_${
    photo.secret
  }`;
  if (size) {
    // サイズ指定ありの場合
    url += `_${size}`;
  }
  url += '.jpg';
  return url;
};

// Flickr画像の元ページのURLを返す
const getFlickrPageURL = photo => `https://www.flickr.com/photos/${photo.owner}/${photo.id}`;

// Flickr画像のaltテキストを返す
const getFlickrText = (photo) => {
  let text = `"${photo.title}" by ${photo.ownername}`;
  if (photo.license === '4') {
    // Creative Commons Attribution（CC BY）ライセンス
    text += ' / CC BY';
  }
  return text;
};

// リクエストパラメータを作る
const parameters = $.param({
  method: 'flickr.photos.search',
  api_key: apiKey,
  text: 'memory', // 検索テキスト
  sort: 'interestingness-desc', // 興味深さ順
  per_page: 10, // 取得件数
  license: '4', // Creative Commons Attributionのみ
  extras: 'owner_name,license', // 追加で取得する情報
  format: 'json', // レスポンスをJSON形式に
  nojsoncallback: 1, // レスポンスの先頭に関数呼び出しを含めない
});
const url = `https://api.flickr.com/services/rest/?${parameters}`;
console.log(url);

// 猫の画像を検索して表示
$.getJSON(url, (data) => {
  console.log(data);

  // データが取得できなかった場合
  if (data.stat !== 'ok') {
    console.error('データの取得に失敗しました。');
    return;
  }

  // 空の<div>を作る
  const $div = $('<div>').addClass('image-gallery');

  for (let i = 0; i < data.photos.photo.length; i++) {
    const photo = data.photos.photo[i];
    const photoText = getFlickrText(photo);

    // $divに <a href="..." ...><img src="..." ...></a> を追加する
    $div.append(
      $('<div>', {
        class: 'image-gallery__item',
      }).append(
        $('<a>', {
          href: getFlickrPageURL(photo),
          class: 'portfolio-box',
          target: '_blank', // リンクを新規タブで開く
          'data-toggle': 'tooltip',
          'data-placement': 'bottom',
          title: photoText,
        }).append(
          $('<img>', {
            src: getFlickrImageURL(photo, 'q'),
            class: 'img-fluid',
            width: 150,
            height: 150,
            alt: photoText,
          }),
        ),
      ),
    );
  }
  // $divを.photosに追加する
  $div.appendTo('.gallery');

  // BootstrapのTooltipを適用
  $('[data-toggle="tooltip"]').tooltip();
});

$(function() {
  $('.slides').not('.slick-initialized').slick();
});
