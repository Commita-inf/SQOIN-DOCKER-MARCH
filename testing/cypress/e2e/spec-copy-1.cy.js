describe('Google Search', () => {
  it('should search for "OpenAI" on Google.com', () => {
    cy.visit('https://www.google.com')
    cy.get('[name="q"]').type('OpenAI')
    cy.get('[name="btnK"]').each(($button) => {
      cy.wrap($button).click().should('have.class', 'active')
    })
    cy.contains('openai.com')
  })
})