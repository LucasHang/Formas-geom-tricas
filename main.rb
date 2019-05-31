def loading
	print 'LOADING'.rjust(35)
	print '.'
	sleep(0.5)
	print '.'
	sleep(0.5)
	print '.'
	sleep(0.5)
	puts ''
end

def menu
	puts '+--------------------------------------------------+'
	print '|'
	print 'MENU'.center(50)
	puts '|'
	puts '+--------------------------------------------------+' 
	puts '| 1-Para escolher a palavra da forca               |'
	puts '| 2-Para que uma palavra aleatória seja escolhida  |'
	puts '| 0-Sair                                           |'
	puts '+--------------------------------------------------+'
end

def limpa_tela
	system("clear")
end

def rodar_jogo(opcao)
	if opcao != 0
		if opcao == 1
			print 'Então, digite a palavra:'
			palavra = gets.strip.downcase

			forca = Forca.new(palavra)
			
			limpa_tela

			loading
			letra_escolhida = ''
			limpa_tela

			puts 'COMEÇOU!!!'.rjust(35)

			sleep(1)
				
				begin
					forca.chute_certo = 0
					limpa_tela
					forca.preenche_slots
					forca.coloca_letra(letra_escolhida)
					if continuar = forca.falta_letra? && forca.erros < 7
						forca.desenho(forca.erros)
						puts forca.letras_secretas.join('  ')
						puts ''
						puts "Letra(s) já digitada(s): #{forca.letras_escritas.join(' - ')}"
						puts ''
						forca.chutar?
						break if forca.chute_certo == true
						next if forca.chute_certo == false
						puts 'Escolha uma letra: '
						letra_escolhida = gets.strip.downcase
						forca.soma_erro(letra_escolhida)
					end
		end while(continuar)
		
		limpa_tela

		forca.resultado(letra_escolhida)

	else opcao == 2

		aux = Forca.new('')
		print 'Escolha um tema(Animais, Frutas, Sentimentos, Politica): '
		tema = gets.strip.downcase.to_sym
		print 'Escolha um número de 1 a 3: '
		num = gets.strip.to_i
	
		palavra = aux.palavras_random(tema,num)
		forca = Forca.new(palavra)

		limpa_tela
		 
		loading

		limpa_tela

		puts 'COMEÇOU!!!'.rjust(35)

		sleep(1)
	
		begin
			forca.chute_certo = 0
				limpa_tela
				forca.preenche_slots
				forca.coloca_letra(letra_escolhida)
				if continuar = forca.falta_letra? && forca.erros < 7
					forca.desenho(forca.erros)
					puts forca.letras_secretas.join('  ')
					puts ''
					puts "Letra(s) já digitada(s): #{forca.letras_escritas.join(' - ')}"
					puts ''
					forca.chutar?
					break if forca.chute_certo == true
					next if forca.chute_certo == false
					puts 'Escolha uma letra: '
					letra_escolhida = gets.strip.downcase
					break if letra_escolhida == forca.palavra
					forca.soma_erro(letra_escolhida)
				end
		end while(continuar)
	
		limpa_tela
	
		forca.resultado(letra_escolhida)
		end
	end
end


require_relative 'forca.rb'

menu
escolha = gets.strip.to_i
limpa_tela

case(escolha)
when	1
	
	rodar_jogo(1)
	
when 2

	rodar_jogo(2)

when 0
	puts 'Bye :)'
	sleep(1)
end