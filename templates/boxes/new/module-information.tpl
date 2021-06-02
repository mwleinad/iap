<div id="accordion">
    {if $myModule.welcomeTextDecoded != ""}
        <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Bienvenida
                    </button>
                </h5>
            </div>
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="card-body">{$myModule.welcomeTextDecoded}</div>
            </div>
        </div>
    {/if}
    {if $myModule.introductionDecoded != ""}
        <div class="card">
            <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        Introducción
                    </button>
                </h5>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                <div class="card-body">{$myModule.introductionDecoded}</div>
            </div>
        </div>
    {/if}
    {if $myModule.intentionsDecoded != ""}
        <div class="card">
            <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        Intenciones del Curso
                    </button>
                </h5>
            </div>
            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                <div class="card-body">{$myModule.intentionsDecoded}</div>
            </div>
        </div>
    {/if}
    {if $myModule.objectivesDecoded != ""}
        <div class="card">
            <div class="card-header" id="headingFour">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        Objetivos del Curso
                    </button>
                </h5>
            </div>
            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
                <div class="card-body">{$myModule.objectivesDecoded}</div>
            </div>
        </div>
    {/if}
    {if $myModule.themesDecoded != ""}
        <div class="card">
            <div class="card-header" id="headingFive">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                        Temas
                    </button>
                </h5>
            </div>
            <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion">
                <div class="card-body">{$myModule.themesDecoded}</div>
            </div>
        </div>
    {/if}
    {if $myModule.schemeDecoded != ""}
        <div class="card">
            <div class="card-header" id="headingSix">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                        Esquema
                    </button>
                </h5>
            </div>
            <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordion">
                <div class="card-body">{$myModule.schemeDecoded}</div>
            </div>
        </div>
    {/if}
    {if $myModule.methodologyDecoded != ""}
        <div class="card">
            <div class="card-header" id="headingSeven">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                        Metodología
                    </button>
                </h5>
            </div>
            <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordion">
                <div class="card-body">{$myModule.methodologyDecoded}</div>
            </div>
        </div>
    {/if}
    {if $myModule.politicsDecoded != ""}
        <div class="card">
            <div class="card-header" id="headingEight">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                        Políticas
                    </button>
                </h5>
            </div>
            <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordion">
                <div class="card-body">{$myModule.politicsDecoded}</div>
            </div>
        </div>
    {/if}
    {if $myModule.evaluationDecoded != ""}
        <div class="card">
            <div class="card-header" id="headingNine">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
                        Evaluación
                    </button>
                </h5>
            </div>
            <div id="collapseNine" class="collapse" aria-labelledby="headingNine" data-parent="#accordion">
                <div class="card-body">{$myModule.evaluationDecoded}</div>
            </div>
        </div>
    {/if}
    {if $myModule.bibliography != ""}
        <div class="card">
            <div class="card-header" id="headingTen">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
                        Bibliografía
                    </button>
                </h5>
            </div>
            <div id="collapseTen" class="collapse" aria-labelledby="headingTen" data-parent="#accordion">
                <div class="card-body">{$myModule.bibliographyDecoded}</div>
            </div>
        </div>
    {/if}
</div>