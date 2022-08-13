Rails.application.routes.draw do
  post "/wp-admin/admin-ajax.php", to: "welcome#ajaxecard"

    get "/wp-content/:param/:id/:id2/:namepic", to: "welcome#pic", constraints: { namepic: /[^\/]+/ }
    get "/wp-content/uploads/:id/:id2/:namepic", to: "welcome#pic", constraints: { namepic: /[^\/]+/ }

  get "/wp-content/:param/:id/:id2/:id23/:namepic", to: "welcome#pic", constraints: { namepic: /[^\/]+/ }
  get "/wp-content/:param/:id/:id2/:id5/:id4/:id3/:id9/:namepic", to: "welcome#myjs", constraints: { namepic: /[^\/]+/ }
  get 'event/index'
  get 'restaurants_et_barss/:title', to: 'restaurant#show'
  get 'ou_dormir/:title', to: 'hotel#show'
  get 'event/:name/', to: 'event#show'
  get "/type_detablissement_restaurant/:name", to: "restaurant#typeresto"
  get 'event-type/:name', to: 'event#eventtype'
  get 'localisation_restaurants_et_bars/:name', to: 'restaurant#localisation'
  get 'mode_de_paiement_restaurant/:name', to: 'restaurant#modepaiement'
  get 'type_de_cuisine_restaurant/:name', to: 'restaurant#typedecuisine'
  get 'services_restaurant/:name', to: 'restaurant#services'
  get 'localisation_ou_dormir/:name', to: 'hotel#localisation'
  get 'type_detablissement_ou_dormir/:name', to: 'hotel#typelogement'
  get 'tarifs_ou_dormir/:name', to: 'hotel#prix'
  get 'services_ou_dormir/:name', to: 'hotel#services'
  get 'mode_de_reglement_ou_dormir/:name', to: 'hotel#modepaiement'
  
  get "un-peu-dhistoire", to: "discover#history"
  get "incontournables", to:"discover#incontournables"
  get "experiences-a-vivre", to:"discover#tolive"
  get "sports-et-loisirs", to:"discover#sport"
  get "les-mysteres-de-louest", to:"discover#mysteres"
  get "restaurants-et-bars", to:"experience#restaurants"
  get "agenda-et-evenements", to:"experience#agenda"
  get "equipements-culturels", to:"discover#culture"
  get "ou-dormir", to:"hotel#hotels"
  get "/envoyer-une-ecard", to: "welcome#ecard", as: :sendecard
  post "/envoyer-une-ecard", to: "welcome#ecard"
  get "infos-pratiques", to: "infos#index"
  get "annoncez-votre-evenement", to: "welcome#annoncez"
  post "annoncez-votre-evenement", to: "welcome#annoncezajax"
  get "contactez-nous", to: "welcome#contactus"
  post "contactez-nous", to: "welcome#contactuspost"
  get "covid-19", to: "welcome#covid19"
  get "credits", to: "welcome#credits"
  get "demarche-qualite", to: "welcome#demarchequalite"
  get "devenir-partenaire", to: "welcome#partenaire"
  get "espace-pro", to: "welcome#espacepro"
  get "mentions-legales", to: "welcome#mentionslegales"
  get "mieux-connaitre-votre-ot", to: "welcome#connaitreot"
  get "newsletter", to: "welcome#newsletter"
  get "observatoire", to: "welcome#observatoire"
  get "plan-du-site", to: "welcome#plandusite"
  get "sitemap", to: "welcome#plandusite"
  get "porteurs-de-projet", to: 'welcome#porteurprojet'
  #get ":title", to: 'welcome#article'
  post "", to: "welcome#postpic", as: :postpic
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
