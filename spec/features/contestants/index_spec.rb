require 'rails_helper'

RSpec.describe 'contestants index page' do
  it 'I see a list of all the contestants as well as their projects' do
    #     As a visitor,
    # When I visit the contestants index page ("/contestants")
    # I see a list of names of all the contestants
    # And under each contestants name I see a list of the projects (names) that they've been on

    # (e.g.   Kentaro Kameyama
    #         Projects: Litfit, Rug Tuxedo

    #         Jay McCarroll
    #         Projects: LeatherFeather)
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    cp_1 = ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    cp_2 = ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
    
    visit '/contestants'

    expect(page).to have_content("Jay McCarroll")
    expect(page).to have_content("News Chic")
    expect(page).to have_content("Gretchen Jones")
    expect(page).to have_content("Upholstery Tuxedo")
  end
end