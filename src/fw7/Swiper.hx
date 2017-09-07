package fw7;

typedef SwiperParams = {
	? initialSlide: Int,
	? direction: String,
}

@:native("Swiper")
@:selfCall
extern class Swiper {
	
	public function new(params: SwiperParams);

}