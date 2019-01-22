require 'bundler'
Bundler.require

require_relative '../app/scrapper.rb'
require_relative 'done.rb'


class Menu

  def choice
    puts `clear`
    puts "----------------------------------"
    puts " "
    puts "| Bienvenue dans notre scrapper! |"
    puts " "
    puts "----------------------------------"
    puts " "
    puts " Dans quels formats souhaitez vous exporter les données ?"
    puts " "
    puts "> 1 pour le format JSON"
    puts "> 2 pour le format Google Spreadsheet"
    puts "> 3 pour le format CSV"
    puts "> 4 pour quitter"
    puts " "
    print "> "
    @@choice = gets.chomp.to_i
    
   mairie = Scrapper.new
   
   case

     when @@choice == 1
      sleep(1)
      puts "Work in progress..."
      sleep(3)
      mairie.save_as_json
      puts "Done!"
      sleep(3)
      choice
     when @@choice == 2
      sleep(1)
      puts "Work in progress..."
      sleep(3)
      mairie.save_as_spreadsheet
      puts "Done!"
      sleep(3)
      choice
     when @@choice == 3
      sleep(1)
      puts "Work in progress..."
      sleep(3)
      mairie.save_as_csv
      puts "Done!"
      sleep(3)
      choice
     when @@choice == 4
      done = Quit.new.quit
      done
     when @@choice > 4 && @@choice < 1 #ne fonctionne pas
        puts "Il n'y a pas de porte secrète"
        @@choice = gets.chomp.to_i
     end
  end
end
