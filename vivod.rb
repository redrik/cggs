#!/usr/bin/env ruby
#encoding: UTF-8
#Простой вывод расчетов звездочки в терминал
$:.unshift(File.dirname(__FILE__)) 
require "cep_zv.rb"

class Vivod < CepZv
	def initialize(argv)
		@argv = argv
		if argv[0] == "-h" or argv[0] == nil
			puts "Справка по аргументам."
			puts "Первый аргумент это число зубьев звездочки."
			puts "Второй аргумент диаметр элемента зацепления цепей."
			puts "Третий аргумент шаг цепи."
		else
			
			t = CepZv.new
			t.set_temp(argv[0].to_f, argv[1].to_f, argv[2].to_f)
			vivod(t)
			#Какие переменные используются
			#Число зубьев звездочки
			#Диаметр элемента зацепления цепей	
			#Шаг цепи
		end
		
	end
	def vivod(t)
		puts "Число зубьев: #{@argv[0]}"
		puts "Диаметр элемента зацепления цепей: #{@argv[1]}"
		puts "Шаг цепи: #{@argv[2]} \n"
		puts "Диаметр окружности выступов De: #{t.diam_del_okr_vist.round(2)}" 
		puts "Диаметр окружности впадин Di: #{t.diam_okr_vpadin.round(2)}"
		puts "Диаметр делительной окружности dd: #{t.diam_del_okruzhn.round(2)}"
		puts "Расстояние между центрами дуг впадин е: #{t.smesch_centr_dug_vpad.round(2)}"
		puts "Радиус впадин r: #{t.radius_vpadin.round(2)}"
		puts "Радиус сопряжения r1: #{t.radius_sopr.round(2)}"
		puts "Прямой участок профиля FC: #{t.pryam_uch_prof.round(2)}"
		puts "Радиус головки зуба r2: #{t.radius_gol_zuba.round(2)}"
		puts "Половина угла впадины (альфа): #{t.pol_ugla_vpad.round(2)}"
		puts "Угол сопряжения (бета): #{t.ugol_sopr.round(2)}"
		puts "Половина угла зуба (j или фи): #{t.polovina_ugla_zuba.round(2)}"
		puts "Координаты точки о1: x = #{t.coord_t_o1["x"].round(2)}"
		puts "		     y = #{t.coord_t_o1["y"].round(2)}"
		puts "Координаты точки о2: x = #{t.coord_t_o2["x"].round(2)}"
		puts "		     y = #{t.coord_t_o2["y"].round(2)}"		
	end	
end

t = Vivod.new(ARGV)