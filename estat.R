# Carregar bibliotecas necessárias
library(ggplot2)
library(dplyr)

# Criar dataframe
df <- data.frame(
  dieta = c(rep("A", 5), rep("B", 5), rep("C", 5)),
  idade = c(18, 15, 28, 35, 26, 43, 17, 40, 14, 18, 37, 21, 16, 27, 41),
  pesoD0 = c(85, 66, 72, 80, 68.5, 78, 64, 88, 70, 95, 86, 86.5, 72.5, 70,104),
  pesoD30 = c(83,60 ,69.5 ,77.5 ,65 ,73.5 ,61 ,83.5 ,68 ,91.5 ,85.5 ,86.5 ,73 ,69 ,102.5),
  pesoD60 = c(82.5 ,61 ,69 ,76 ,65.5 ,70 ,58.5 ,82.5 ,65 ,90 ,86.5 ,85 ,73 ,72 ,103.5)
)

# Calcular a variação de peso
df <- df %>%
  mutate(variacao_D0_D30 = pesoD0 - pesoD30,
         variacao_D30_D60 = pesoD30 - pesoD60)

# Gráfico de variação de peso entre D0 e D30
ggplot(df, aes(x=dieta, y=variacao_D0_D30)) +
  geom_boxplot(fill = "lightblue") +
  labs(title="Variação de peso entre D0 e D30",
       x="Dieta", y="Variação de Peso (kg)")

# Gráfico de variação de peso entre D30 e D60
ggplot(df, aes(x=dieta, y=variacao_D30_D60)) +
  geom_boxplot(fill = "lightblue") +
  labs(title="Variação de peso entre D30 e D60",
       x="Dieta", y="Variação de Peso (kg)")
