class AddFuncaoIdToUsers < ActiveRecord::Migration[7.2]
  def change
    # Primeiro, você pode adicionar a coluna sem a restrição de `null: false`
    add_reference :users, :funcao, foreign_key: true
    
    # Agora, preencha os valores de `funcao_id` para todos os usuários existentes
    # Supondo que você tenha ao menos uma função no banco, podemos usar a primeira função existente como exemplo
    default_funcao = Funcao.first.id
    User.update_all(funcao_id: default_funcao)

    # Agora, podemos garantir que a coluna `funcao_id` não será nula
    change_column_null :users, :funcao_id, false
  end
end
