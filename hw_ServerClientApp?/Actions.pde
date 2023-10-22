class reloadAction implements Action{
  void action(){
    operator.reload();
  }
}
class hrefAction implements Action{
  String url = "";
  hrefAction(String href){
    url = href;
  }
  void action(){
    operator.request(url,null);
  }
}
