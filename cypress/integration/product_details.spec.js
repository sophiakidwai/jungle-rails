describe('Product detail page', () => {
  it('should visit the home page', () => {
    cy.visit('/');
  });

  it('should show products on page', () => {
    cy.get('.products article').should('be.visible');
  });

  it('should show all products on page', () => {
    cy.get('.products article').should('have.length', 2);
  });

  it('should show details of product clicked', () => {
    cy.get('.products > :nth-child(1)').click();
    cy.get('.product-detail').should('exist');
  });
});