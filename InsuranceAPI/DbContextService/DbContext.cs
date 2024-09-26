using InsuranceAPI.Models;

namespace InsuranceAPI.DbContextService
{
    public class DbContext : IDbContext
    {
        public List<OutputModel> GetInsuranceData(int PolicyId)
        {
            List<OutputModel> obj = null;
            using (InsurancePolicyContext dbContext = new InsurancePolicyContext())
            {
                obj = (from _policy in dbContext.Policies
                       join _Endorsement in dbContext.Endorsements on _policy.PolicyId equals _Endorsement.PolicyId
                       join _Submission in dbContext.Submissions on _policy.PolicyId equals _Submission.PolicyId
                       where _policy.PolicyId == PolicyId
                       select new OutputModel
                       {
                           PolicyId = _policy.PolicyId,
                           PolicyNumber = _policy.PolicyNumber,
                           PolicyHolderName = _policy.PolicyHolderName,
                           IsRenewal = _policy.IsRenewal,
                           StartDate = _policy.StartDate,
                           EndDate = _policy.EndDate,

                           EndorsementId = _Endorsement.EndorsementId,
                           EndorsementDetails = _Endorsement.EndorsementDetails,
                           EndorsementDate = _Endorsement.EndorsementDate,

                           SubmissionId = _Submission.SubmissionId,
                           SubmissionDate = _Submission.SubmissionDate,
                           SubmissionStatus = _Submission.SubmissionStatus,
                       }).ToList();
            }
            return obj;
        }
    }
}
