#encoding: UTF-8
#Расчет звездочки цепной передачи
#имея шаг цепи, диаметр элемента зацепления и количество
#зубьев шестерни
#
class CepZv 
	def initialize()
		
	end	
	def set_temp(z = 0, dc = 0, t = 0)
		@Z =  z 	#Число зубьев звездочки
		@Dc = dc	#Диаметр элемента зацепления цепей
		@t = t		#Шаг цепи
	end
	#Геометрическая характеристика зацепления(альфа)
	def geom_har_zac()
		alpha = (@t.to_f)/(@Dc.to_f)
	end
	#Диаметр делительной окружности dd
	def diam_del_okruzhn
		dd = @t/(Math.sin(degtorad(180.0/@Z)))		
	end
	#Диаметр делительной окружности выступов De
	def diam_del_okr_vist
		@t*(koef_vis_zuba + 1/(Math.tan(degtorad(180.0/@Z))))
	end
	#Диаметр окружности впадин Di
	def diam_okr_vpadin
		diam_del_okruzhn-2*radius_vpadin
	end
	#Коэффициент высоты зуба К
	def koef_vis_zuba
		case geom_har_zac.round(2)
		when 1.40..1.50
			return 0.480
		when 1.51..1.60
			return 0.532
		when 1.61..1.70
			return 0.555
		when 1.71..1.80
			return 0.575
		when 1.81..2.00
			return 0.565
		else 
			puts "Не верная величина геометрической характеристики зацепления = #{geom_har_zac}"								
		end			
	end
	#Радиус впадин r
	def radius_vpadin
		r = 0.5025*@Dc+0.05
	end
	#Радиус сопряжения r1
	def radius_sopr
		0.8*@Dc + radius_vpadin
	end
	#Радиус головки зуба r2
	def radius_gol_zuba
		@Dc*(1.24*Math.cos(degtorad(polovina_ugla_zuba)) + 0.8*Math.cos(degtorad(self.ugol_sopr))-1.3025)-0.05
	end
	#Половина угла зуба (j или фи)
	def polovina_ugla_zuba
		17.0-(64.0/@Z)
	end
	#Половина угла впадины альфа
	def pol_ugla_vpad
		55.0-(60/@Z)
	end
	#Угол сопряжения (бета)
	def ugol_sopr
		18.0-(56.0/@Z)
	end
	#Прямой участок профиля FC
	def pryam_uch_prof
		@Dc*(1.24*Math.sin(degtorad(polovina_ugla_zuba)) - 0.8*Math.sin(degtorad(ugol_sopr)))
	end
	#Расстояние от центра дуги впадины до 
	#центра дуги головки зуба oo2
	def rast_oo2
		1.24*@Dc
	end
	#Смещение центров дуг впадин е
	def smesch_centr_dug_vpad
		0.03*@t
	end
	#Координаты точки о1(возвращает хеш значений)
	#Центр координат равен центру диаметра элемента зацепления
	def coord_t_o1
		x = -0.8*@Dc*Math.sin(degtorad(pol_ugla_vpad))
		y = 0.8*@Dc*Math.cos(degtorad(pol_ugla_vpad))
		{ "x" => x, "y" => y }
	end
	#Координаты точки о2 возвращает хеш значений)
	#Центр координат равен центру диаметра элемента зацепления
	def coord_t_o2
		x = 1.24*@Dc*Math.cos(degtorad(180.0/@Z))
		y = 1.24*@Dc*Math.sin(degtorad(180.0/@Z))
		{ "x" => x, "y" => y }
	end
	#Перевод из радианов в деги
	def radtodeg(rad)
    	deg = rad/(Math::PI*180.0)
	end
	#Перевод из дегов в радианы
	def degtorad(deg)
		rad = deg*(Math::PI/180.0)
	end
end