feature 'Project' do
  context 'No projects have been added' do
    scenario 'Displays a prompt to add a project' do
      visit '/projects'
      expect(page).to have_link 'Add a project'
    end
  end
end