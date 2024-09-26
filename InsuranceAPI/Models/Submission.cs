using System;
using System.Collections.Generic;

namespace InsuranceAPI.Models;

public partial class Submission
{
    public int SubmissionId { get; set; }

    public int? PolicyId { get; set; }

    public DateOnly? SubmissionDate { get; set; }

    public string? SubmissionStatus { get; set; }
}
