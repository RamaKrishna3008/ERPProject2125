package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.sdp.model.FeePayments;
import java.util.List;


public interface FeePaymentRepository extends JpaRepository<FeePayments, Long>
{
	public FeePayments findByOrderId(String orderId);
	public List<FeePayments> findByStudentId(String studentId);
	@Query("select f from FeePayments f where f.paymentStatus = 'Paid'")
	public List<FeePayments> viewPaidPayments();
}
