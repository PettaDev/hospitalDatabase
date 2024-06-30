# Crie um script que adicione uma coluna “em_atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 

# Crie um script para atualizar ao menos dois médicos como inativos e os demais em atividade.

-- Adicionar a coluna em_atividade na tabela medicos definindo (true 1 para todos)
ALTER TABLE medicos ADD COLUMN em_atividade BOOLEAN NOT NULL DEFAULT TRUE;

-- Atualizar o status de atividade dos médicos
-- Pelo menos dois medicos como inativos (false)
UPDATE medicos SET em_atividade = FALSE WHERE medico_id IN (1, 2);

-- Atualizar os demais médicos como em atividade (true)
UPDATE medicos SET em_atividade = TRUE WHERE medico_id NOT IN (1, 2);
