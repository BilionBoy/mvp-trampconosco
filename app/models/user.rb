# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associação com Funcao
  belongs_to :funcao

  # Validação do campo 'funcao_id'
  validates :funcao_id, presence: true
end
