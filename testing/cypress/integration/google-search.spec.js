describe('Google Search', () => {
    it('should search for "OpenAI" on Google.com', () => {
      cy.visit('https://www.google.com')
      cy.get('[name="q"]').type('OpenAI')
      cy.get('[name="btnK"]').click()
      cy.contains('openai.com')
    })
  })
  