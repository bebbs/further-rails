feature 'Project' do

  before(:each) do
    visit '/projects'
  end

  context 'Display projects' do


    before(:each) do
      @project = Project.create(name: 'Sample project', description: 'Sample description')
      visit '/projects'
    end

    scenario 'Lists all of the projects' do
      expect(page).to have_content 'Sample project'
    end

    scenario 'Displays a single project' do
      save_and_open_page
      click_link 'Sample project'

      expect(page).to have_content 'Sample project'
      expect(page).to have_content 'Sample description'
      expect(current_path).to eq "/projects/#{@project.id}"
    end

    scenario 'Displays a prompt to add a project' do
      expect(page).to have_link 'Add a project'
    end
  end

  context 'Adding a project' do

    before(:each) do
      click_link 'Add a project'
    end

    scenario 'Displays a form to add the project' do
      expect(page).to have_content 'Project Name:'
      expect(page).to have_content 'Description:'
    end

    scenario 'Accepts a project and displays it on the projects page' do
      fill_in 'Project Name:', with: 'Widget Generator'
      fill_in 'Description:', with: 'Sample description'
      click_button 'Create Project'

      expect(page).to have_content 'Project Name: Widget Generator'
      expect(page).to have_content 'Sample description'
    end
  end

  context 'Editing a project' do

    before(:each) do
      click_link 'Add a project'
    end

    scenario 'Displays a form to edit the project' do

    end
  end
end