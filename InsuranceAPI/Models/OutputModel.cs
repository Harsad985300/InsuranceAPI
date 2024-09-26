namespace InsuranceAPI.Models
{
    public class OutputModel
    {
        public int PolicyId { get; set; }

        public string PolicyNumber { get; set; } = null!;

        public string? PolicyHolderName { get; set; }

        public bool? IsRenewal { get; set; }

        public DateOnly? StartDate { get; set; }

        public DateOnly? EndDate { get; set; }
        public int EndorsementId { get; set; }

        public string? EndorsementDetails { get; set; }

        public DateOnly? EndorsementDate { get; set; }
        public int SubmissionId { get; set; }

        public DateOnly? SubmissionDate { get; set; }

        public string? SubmissionStatus { get; set; }
    }
}
