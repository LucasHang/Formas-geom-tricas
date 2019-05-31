class Forca
	attr_reader :letras_secretas,:letras_escritas,:erros,:palavra
	attr_accessor :chute_certo
	def initialize(palavra)
		@palavra = palavra
		@palavras = @palavra.split(' ')
		@letras_secretas = []
		separar
		@letras_escritas = []
		@erros = 0
		@chute_certo = false
		@palavras_random = {animais: ['salmão','tigre','elefante-africano'],frutas: ['tangerina','mamão papaia','fruta do conde'],sentimentos: ['desespero','angústia','solidão'],politica: ['betinho souza','luís bolsonaro','marina']}
	end

	def welcome
		puts 'Créditos : Lucas Hang :)'.rjust(80)
		puts ''
		puts '||||||||   ||||||    ||||||      ||||||   ||||||||'.rjust(60)
		puts '||        ||    ||   ||   ||    ||        ||    ||'.rjust(60)
		puts '||||||    ||    ||   ||||||     ||        ||||||||'.rjust(60)
		puts '||        ||    ||   ||   ||    ||        ||    ||'.rjust(60)
		puts '||         ||||||    ||    ||    ||||||   ||    ||'.rjust(60)
	end

	def desenho(num)
			if num == 0
					puts '      _________'
			puts '     /         \\'
			puts '    /          |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			print "'''''''''    "
			elsif num == 1
			puts '      _________'
			puts '     /         \\'
			puts '    /         _|_'
			puts '    |        /x x\\'
			puts '    |        \\_~_/'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			print "'''''''''    "
		elsif num == 2
			puts '      _________'
			puts '     /         \\'
			puts '    /         _|_'
			puts '    |        /x x\\'
			puts '    |        \\_~_/'
			puts '    |   _|_    |'
			puts '    |    |-----|'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			print "'''''''''    "
		elsif num == 3
			puts '      _________'
			puts '     /         \\'
			puts '    /         _|_'
			puts '    |        /x x\\'
			puts '    |        \\_~_/'
			puts '    |   _|_    |    _|_'
			puts '    |    |-----|-----|'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			print "'''''''''    "
		elsif num == 4
			puts '      _________'
			puts '     /         \\'
			puts '    /         _|_'
			puts '    |        /x x\\'
			puts '    |        \\_~_/'
			puts '    |   _|_    |    _|_'
			puts '    |    |-----|-----|'
			puts '    |          |'
			puts '    |          |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			puts '    |'
			print "'''''''''    "
		elsif num == 5
			puts '      _________'
			puts '     /         \\'
			puts '    /         _|_'
			puts '    |        /x x\\'
			puts '    |        \\_~_/'
			puts '    |   _|_    |    _|_'
			puts '    |    |-----|-----|'
			puts '    |          |     '
			puts '    |          |'
			puts '    |         / '
			puts '    |        /'
			puts '    |      _/'
			puts '    |'
			puts '    |'
			puts '    |'
			print "'''''''''    "
		elsif num == 6
			puts '      _________'
			puts '     /         \\'
			puts '    /         _|_'
			puts '    |        /x x\\'
			puts '    |        \\_~_/'
			puts '    |   _|_    |    _|_'
			puts '    |    |-----|-----|'
			puts '    |          |     '
			puts '    |          |'
			puts '    |         / \\'
			puts '    |        /   \\'
			puts '    |      _/     \\_'
			puts '    |'
			puts '    |'
			puts '    |'
					print "'''''''''    "
			end
	end

	def resultado(letra_escolhida)

		if @erros < 7 || letra_escolhida == @palavra
			puts "PARABÉNS MEU GUERREIRO, VOCÊ SALVOU A VIDA DO JORGE HENRIQUE ACERTANDO A PALAVRA '#{@palavra}' "
		else
			puts "SINTO MUITO MEU GUERRA, JORGE HENRIQUE PERDEU A VIDA PORQUE VOCÊ NÃO ACERTOU A PALAVRA '#{@palavra}' "
		end
	end

	def preenche_slots
			if @letras_secretas[0].empty?
				cont = 0
				@letras.each do |palavra|
					for letra in 0..palavra.length-1 do
						@letras_secretas[cont] << '_'
					end
					if palavra.count('-') > 0
						cont_aux = 0
						palavra.each do |aux|
							if aux.count('-') > 0
								@letras_secretas[cont].insert(cont_aux,'-')
							end
							cont_aux += 1
						end
					end
					if @letras[cont+1].nil?
						@letras_secretas[cont] << ''
					else
						@letras_secretas[cont] << ' '
					end
					cont += 1
					end
			end
	end

	def coloca_letra(letra_escolhida='&')
			cont = 0
			@letras.each do |palavra|
			for letra in 0..palavra.length-1 do
							if letra_escolhida == palavra[letra]
									@letras_secretas[cont][letra].replace(palavra[letra].upcase)
							end
					end
					cont += 1
			end
			@letras_escritas << letra_escolhida
	end

	def separar
			@letras = []
		@palavras.each do |palavra|
				@letras << palavra.split('')
				@letras_secretas << []
		end
	end

	def soma_erro(letra_escolhida)
		if @letras_escritas.count(letra_escolhida) > 0
			@erros += 1
		elsif @palavra.count(letra_escolhida) < 1
			@erros += 1
		end
	end

	def falta_letra?
			@letras_secretas.each do |letra|
					if letra.count('_') > 0
						return true
					end
			end
			return false
	end

	def palavras_random(tema,num)
		@palavras_random[tema][num-1]
	end

	def chutar?
		puts 'Deseja chutar a palavra?(s/n)'
		resposta = gets.strip.downcase
		if resposta == 's'
			print 'Então digite a palavra: '
			palavra = gets.strip.downcase
			acertou_chute?(palavra)
		end
	end

	def acertou_chute?(palavra_escolhida)
		if palavra_escolhida == @palavra
			@chute_certo = true
		else
			@chute_certo = false
			@erros += 2
		end
	end

end