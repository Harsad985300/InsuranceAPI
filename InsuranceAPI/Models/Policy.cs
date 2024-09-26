using System;
using System.Collections.Generic;

namespace InsuranceAPI.Models;

public partial class Policy
{
    public int PolicyId { get; set; }

    public string PolicyNumber { get; set; } = null!;

    public string? PolicyHolderName { get; set; }

    public bool? IsRenewal { get; set; }

    public DateOnly? StartDate { get; set; }

    public DateOnly? EndDate { get; set; }
}
