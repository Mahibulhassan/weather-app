

class ImageHelper {

  static String checkImage(String url){
    if(url.contains("https")){
      return url;
    }else{
      return 'https:$url';
    }
  }
}