{
    volScalarField DXEff("DXEff", DX*rho + turbulence->mut()/Sct);

    fvScalarMatrix XEqn
    (
        fvm::ddt(rho,X)
      + fvm::div(phi, X)
      - fvm::laplacian(DXEff, X)
     ==
        fvOptions(rho,X)
    );

    XEqn.relax();

    fvOptions.constrain(XEqn);

    XEqn.solve();

    fvOptions.correct(X);
}
