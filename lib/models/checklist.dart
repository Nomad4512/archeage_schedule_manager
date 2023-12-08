class Checklist {
  
  String longName, shortName, category;
  bool open = false;

  Checklist(this.longName, this.shortName, this.category,this.open);

  static List<Checklist> initializeCheck() {
    List<Checklist> check = [];

    check.add(Checklist('징조의 틈','낮징', '징조', true));
    check.add(Checklist('전장의 안개','밤징', '징조', true));
    check.add(Checklist('징조의 틈','태들징', '징조', true));
    check.add(Checklist('피투성이 악령 군단을 막아라','고래징', '징조', true));
    check.add(Checklist('이프니르의 유산을 지켜라','촛징', '징조', true));
    check.add(Checklist('히라마 차원의 균열','신징조', '징조', false));

    check.add(Checklist('예언의 도래','글레샤', '세력전', true));
    check.add(Checklist('세력 명예의 전장','황평', '세력전', false));
    check.add(Checklist('세력 명예의 전장','가루다', '세력전', false));
    check.add(Checklist('이슬 평원 전쟁','이슬', '세력전', false));
    check.add(Checklist('풍랑의 전조','아켄', '세력전', false));
    check.add(Checklist('바다를 떠도는 탐욕의 망령','델유', '세력전', false));
    check.add(Checklist('레이드',' ', '세력전', false));
    check.add(Checklist('나차쉬 침공전','침공', '세력전', false));
    check.add(Checklist('심연의 습격','심연', '세력전', false));
    check.add(Checklist('신수 쟁탈전','신수', '세력전', false));
    check.add(Checklist('공성전','공성', '세력전', false));

    check.add(Checklist('붉은 용의 둥지','붉은용', '던전', false));
    check.add(Checklist('피의 사자 카둠','카둠', '던전', false));
    check.add(Checklist('히라마칸드 최후의 날','히라마', '던전', true));
    check.add(Checklist('저승의 밤','저밤', '던전', false));
    check.add(Checklist('노르예트 무한대전','노르', '던전', false));
    check.add(Checklist('이프니르의 황금 성소','성소', '던전', false));
    check.add(Checklist('심연에 물든 에아나드 도서관','도서관', '던전', true));

    return check;
  }
  
}