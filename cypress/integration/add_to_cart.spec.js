describe('Add to cart', () => {
  it('should visit the home page', () => {
    cy.visit('/');
  });

  it('should show products on page', () => {
    cy.get('.products article').should('be.visible');
  });

  it('should show all products on page', () => {
    cy.get('.products article').should('have.length', 2);
  });

  it('should add product to cart', () => {
    cy.get('.products > :nth-child(1) > div > .button_to > .btn').click();
    cy.contains('My Cart (1)').should('exist');
  });
});