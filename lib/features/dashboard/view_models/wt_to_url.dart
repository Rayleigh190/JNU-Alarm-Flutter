String wtToUrl(String type) {
  String seletedWt;
  switch (type) {
    case 'wt1':
      seletedWt = 'wt';
      break;
    case 'wt2':
      seletedWt = 'wt2';
      break;
    case 'wt3':
      seletedWt = 'wt3';
      break;
    case 'wt4':
      seletedWt = 'wt4';
      break;
    case 'wt5':
      seletedWt = 'wt5';
      break;
    case 'wt6':
      seletedWt = 'wt6';
      break;
    case 'wt7': // 흐림
    case 'wt30':
    case 'wt31':
      seletedWt = 'wt7';
      break;
    case 'wt8': // 비
    case 'wt9':
    case 'wt10':
    case 'wt15':
    case 'wt23':
    case 'wt24':
    case 'wt26':
    case 'wt27':
    case 'wt34':
    case 'wt35':
    case 'wt38':
    case 'wt39':
      seletedWt = 'wt8';
      break;
    case 'wt11': // 눈
    case 'wt12':
    case 'wt13':
    case 'wt14':
    case 'wt16':
    case 'wt20':
    case 'wt25':
    case 'wt28':
    case 'wt29':
    case 'wt36':
    case 'wt37':
    case 'wt40':
    case 'wt41':
      seletedWt = 'wt11';
      break;
    case 'wt17': // 안개
    case 'wt18':
      seletedWt = 'wt17';
      break;
    case 'wt21': // 황사 낮
    case 'wt22': // 황사 밤
      seletedWt = 'wt21';
      break;
    case 'wt19': // 번개, 뇌우
    case 'wt32':
    case 'wt33':
      seletedWt = 'wt19';
      break;
    default:
      seletedWt = 'wt99';
      break;
  }
  return 'https://jnu-alarm.site/static/weather/$seletedWt.svg';
}
