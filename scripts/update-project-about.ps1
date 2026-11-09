# Run with GitHub CLI authenticated as leyasherman.
# Only the five newly published coursework repositories are changed.
$ErrorActionPreference = 'Stop'
$login = gh api user --jq .login
if ($LASTEXITCODE -ne 0 -or $login -ne 'leyasherman') { throw 'Please sign in to GitHub CLI as leyasherman first.' }
$projects = @(
    @{ Name = 'ai-coding-agents-benchmark'; Description = 'UCL group study comparing AI coding agents on data preparation, modelling and debugging tasks.' },
    @{ Name = 'airline-passenger-satisfaction-ml'; Description = 'Airline satisfaction classification with scikit-learn and XGBoost. Individual UCL predictive analytics coursework.' },
    @{ Name = 'london-property-safety-data-engineering'; Description = 'UCL group coursework connecting London property and crime data through Python, PySpark and S3.' },
    @{ Name = 'nlp-sentiment-analysis'; Description = 'Cross-domain emotion classification with TF-IDF and BERT. UCL NLP group coursework.' },
    @{ Name = 'wembley-transport-business-analytics'; Description = 'Event-related transport demand analysis and illustrative shuttle scenarios using Python and OLS.' }
)
foreach ($project in $projects) {
    gh repo edit "leyasherman/$($project.Name)" --description $project.Description
    if ($LASTEXITCODE -ne 0) { throw "Could not update $($project.Name)." }
}
Write-Host 'Descriptions updated for all five coursework repositories.'
