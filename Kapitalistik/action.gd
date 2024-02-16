extends Node

var rng = RandomNumberGenerator.new()

#1 - Início receba o valor equivalente determinado pelo sorteio
func t1_inicio():
	#Determina quais players são diamante e quais são ferro
	if (GlobalData.flag_caminho == false):
		var players = []
		players.resize(GlobalData.num_players)
		for i in players.size():
			players[i] = i
		players.shuffle()
		var diamante = 0
		var ferro = 0
		
		for i in players.size():
			if (i%2==0):
				GlobalData.caminho[players[i]] = 1 #Diamante
				GlobalData.player_money[players[i]] = 1000 * (i+1)
				print("Jogador ", players[i], " é Diamante, saldo = ", GlobalData.player_money[players[i]])
				if diamante == 0:
					diamante += 1
					GlobalData.playerImagens[i] = load("res://Imgs/diamante1.png")
				else:
					GlobalData.playerImagens[i] = load("res://Imgs/diamante2.png")
			else:
				GlobalData.caminho[players[i]] = 2 #Ferro
				GlobalData.player_money[players[i]] = 1000 * (i+1)
				print("Jogador ", players[i], " é Ferro, saldo = ", GlobalData.player_money[players[i]])
				if ferro == 0:
					ferro += 1
					GlobalData.playerImagens[i] = load("res://Imgs/ferro1.png")
				else:
					GlobalData.playerImagens[i] = load("res://Imgs/ferro2.png")
		
		GlobalData.updatePlayerImagem = true
		GlobalData.flag_caminho = true

#2 - Venda da força de trabalho- Os jogadores 1 e 3- receberão 300$, Os jogadores 2 e 4 - receberão 200$. 
func t2_forca_de_trabalho(playerId):
	print(" -> Casa 2, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] += 300
		print("    ganhou 300, saldo final: ", GlobalData.player_money[playerId])
	else: #Ferro
		GlobalData.player_money[playerId] += 200
		print("    ganhou 300, saldo final: ", GlobalData.player_money[playerId])

#3, 8, 12 - Carta sorte ou revés. (quadro sorte revés)
func t_sorte_ou_reves(playerId, num_sorteado):
	#Determina se vai ser sorte ou revés
	print(" -> Casa S ou R, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	var sorte = rng.randi_range(0,1)
	if (sorte == 0): #sorte
		print("  0 - Sorte")
		if (num_sorteado == 1): #Consultoria de geoprocessamento
			GlobalData.player_money[playerId] += 200
			print("    1 - ganhou 200, saldo final: ", GlobalData.player_money[playerId])
		elif (num_sorteado == 2): #Demissão sem justa causa - indenização trabalhista
			GlobalData.player_money[playerId] += 500
			print("    2 - ganhou 500, saldo final: ", GlobalData.player_money[playerId])
		elif (num_sorteado == 3): #Valorização de suas ações na bolsa
			GlobalData.player_money[playerId] += 200
			print("    3 - ganhou 200, saldo final: ", GlobalData.player_money[playerId])
		else: #Loteria do trabalhador
			GlobalData.player_money[playerId] += 300
			print("    4 - ganhou 300, saldo final: ", GlobalData.player_money[playerId])
	
	else: #revés
		print("  1 - Revés")
		if (num_sorteado == 1): #Foi entregar iFood e a moto quebrou
			GlobalData.player_money[playerId] -= 200
			print("    1 - perdeu 200, saldo final: ", GlobalData.player_money[playerId])
		elif (num_sorteado == 2): #Você foi convidado a investir em bitcoin. Ocorreu uma desvalorização repentina da moeda virtual devido a sua volatilidade
			GlobalData.player_money[playerId] -= 200
			print("    2 - perdeu 200, saldo final: ", GlobalData.player_money[playerId])
		elif (num_sorteado == 3): #Realizou um empréstimo bancário para pagar dívidas, porém houve atraso no pagamento e cobrança de juros
			GlobalData.player_money[playerId] -= 100
			print("    3 - perdeu 100, saldo final: ", GlobalData.player_money[playerId])
		else: #Desvalorização de suas ações na bolsa
			GlobalData.player_money[playerId] -= 200
			print("    4 - perdeu 200, saldo final: ", GlobalData.player_money[playerId])

#4 - Comprar casa
func t4_comprar_casa(playerId):
	print(" -> Casa 4, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] -= 5000
		print("    perdeu 5000, saldo final: ", GlobalData.player_money[playerId])
	else: #Ferro
		GlobalData.player_money[playerId] -= 1500
		print("    perdeu 1500, saldo final: ", GlobalData.player_money[playerId])
	
#5 - Perguntas e respostas
func t5_perguntas(playerId):
	print(" -> Casa 5, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	print("    NÃO IMPLEMENTADA, saldo inalterado: ", GlobalData.player_money[playerId])
	
#6 - Formação Educacional Contínua
func t6_formacao(playerId):
	print(" -> Casa 6, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] -= 200
		print("    perdeu 200, saldo final: ", GlobalData.player_money[playerId])
	else: #Ferro
		GlobalData.player_money[playerId] += 50
		print("    ganhou 50, saldo final: ", GlobalData.player_money[playerId])

#7 - Feira semanal
func t7_feira(playerId):
	print(" -> Casa 7, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] -= 250
		print("    perdeu 250, saldo final: ", GlobalData.player_money[playerId])
	else: #Ferro
		GlobalData.player_money[playerId] -= 150
		print("    perdeu 150, saldo final: ", GlobalData.player_money[playerId])

#9 - Investimento na agricultura familiar
func t9_agricultura(playerId):
	print(" -> Casa 9, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] += 10
		print("    perdeu 10, saldo final: ", GlobalData.player_money[playerId])
	else:
		GlobalData.player_money[playerId] += 40
		print("    ganhou 40, saldo final: ", GlobalData.player_money[playerId])

#10 - Contratação de servico de saúde
func t10_plano_de_saude(playerId):
	print(" -> Casa 10, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	if (GlobalData.caminho[playerId] == 1): #Diamante
		GlobalData.player_money[playerId] -= 200
		print("    perdeu 200, saldo final: ", GlobalData.player_money[playerId])
	#Ferro não ganha nem perde nesta casa
	else:
		print("    sem alteração, saldo final: ", GlobalData.player_money[playerId])

#11 - Taxação de fortunas
func t11_grandes_fortunas(playerId):
	print(" -> Casa 11, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	if (GlobalData.caminho[playerId] == 1): #Diamante
		var desconto = int(0.2 * GlobalData.player_money[playerId])
		GlobalData.player_money[playerId] -= desconto
		print("    perdeu ", desconto, " , saldo final: ", GlobalData.player_money[playerId])
	else: #Ferro
		var desconto = int(0.1 * GlobalData.player_money[playerId])
		GlobalData.player_money[playerId] -= desconto
		print("    perdeu ", desconto, " , saldo final: ", GlobalData.player_money[playerId])

#13 - Renda básica universal
func t13_renda_basica(playerId):
	print(" -> Casa 13, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	GlobalData.player_money[playerId] += 400
	print("    ganhou 400, saldo final: ", GlobalData.player_money[playerId])

#14 - Recuperação ambiental
func t14_recuperacao_ambiental(playerId):
	print(" -> Casa 14, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	GlobalData.player_money[playerId] -= 200
	print("    perdeu 200, saldo final: ", GlobalData.player_money[playerId])
#15 - Férias
func t15_ferias(playerId):
	print(" -> Casa 15, saldo inicial de ", playerId, ": ", GlobalData.player_money[playerId])
	GlobalData.player_money[playerId] += 100
	print("    ganhou 100, saldo final: ", GlobalData.player_money[playerId])	
