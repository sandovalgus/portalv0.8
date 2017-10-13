class ImportWorker < ApplicationController
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(path, params)
		puts " *******************************  Importando clientes **************************************"
		Customer.import(path, params)
		puts " *******************************  Actualizando tabla importacion ***************************"
		Import.update(true)
	end
end